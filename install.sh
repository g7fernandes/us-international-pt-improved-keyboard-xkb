#!/bin/bash

set -e

SCRIPT=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

# The default path to xkb is the one below.
# You can use the 'tests' directory for testing:
# XKB_PATH=tests/xkb ./install.sh
if [ -z "$XKB_PATH" ]; then
    XKB_PATH="/usr/share/X11/xkb"
else
    echo "Using custom XKB_PATH: $XKB_PATH"
fi

if [ ! -d $XKB_PATH ]; then
    echo "xkb folder not found at $XKB_PATH"
    echo "Pass the location of 'xkb' with"
    echo "XKB_PATH=/pathTo/xkb ./install"
    exit 2
fi

exit_on_error() {
    if [ $1 -ne 0 ]; then
        echo "Error: Could not edit file $2"
    fi
}

exit_if_empty() {
    if [ -z "$1" ]; then
        revert
        echo "Expected line of text not found at file $2"
        exit 2
    fi
}


insert_text_to_file() {
    EDITFILE=$1
    SNIPPETFILE=$2
    LINE=$3
    ed "$EDITFILE" << EOF
    ${LINE}r ${SNIPPETFILE}
    w
EOF
}

create_backups() {
    sudo cp -n "$XKB_PATH"/symbols/us "$XKB_PATH"/symbols/us.BKP
    sudo cp -n "$XKB_PATH"/rules/base.lst "$XKB_PATH"/rules/base.lst.BKP
    sudo cp -n "$XKB_PATH"/rules/evdev.lst "$XKB_PATH"/rules/evdev.lst.BKP
    sudo cp -n "$XKB_PATH"/rules/base.xml "$XKB_PATH"/rules/base.xml.BKP
    sudo cp -n "$XKB_PATH"/rules/evdev.xml "$XKB_PATH"/rules/evdev.xml.BKP
}

revert() {
    sudo cp "$XKB_PATH"/symbols/us.BKP "$XKB_PATH"/symbols/us
    sudo cp "$XKB_PATH"/rules/base.lst.BKP "$XKB_PATH"/rules/base.lst
    sudo cp "$XKB_PATH"/rules/evdev.lst.BKP "$XKB_PATH"/rules/evdev.lst
    sudo cp "$XKB_PATH"/rules/base.xml.BKP "$XKB_PATH"/rules/base.xml
    sudo cp "$XKB_PATH"/rules/evdev.xml.BKP "$XKB_PATH"/rules/evdev.xml
}

check_for_backups() {
    BKPS=$(find "$XKB_PATH/rules" "$XKB_PATH/symbols" -type f -name "*.BKP")

    if [[ -n $BKPS ]]; then
        echo "Backups de layouts encontrados! Gostaria de restaurá-los antes de criar novos (recomendado)? [s/n/c (cancel)]"
        printf "Layout files backups found! Would you like to restore them before installing the new (recomended)? [y/n/c (cancel)] "
        read -rp "" answer
        case ${answer:0:1} in
            y|Y|s|S )
                echo "Restauring backups..."
                revert
            ;;
            n|N )
                echo "xkb files will be appended."
            ;;
            * )
                echo "Backups foud:"
                echo "$BKPS"
                exit 0
            ;;
        esac
    fi
}

show_help_pt() {
    printf "\033[1mLayout US Internacional melhorado para língua portuguesa\033[0m
Este script pode instalar até três opções de layouts.
Todos layouts disponibilizam 'ã', 'õ' e 'ç' no nível 3 (AltGr) das teclas <F>,
<G> e <C> respectivamente. Se nenhuma das opções -t e -d forem usadas,
ambos layouts serão instalados.
Backups dos arquivos xkb serão criados antes de instalar.

Uso: ./install [OPÇÕES]
  -d, --deadkeys              Instala layout mantendo as teclas mortas do tecla-
                              -do US. Internacional. Ou seja, para digitar 'à',
                              deve-se teclar [Shift + \`] + A.
  -t, --third-lv-deadkeys     Instala layout, mas teclas mortas são trasnferidas
                              para o nivel 3. Ou seja, para digitar 'à', deve-se
                              usar [AltGr + \`] + A.
  -c, --lv3-dead-lv2-circum   Mesmo que -t, mas mantém circunflexo morto no ní-
                              -vel 2 de 6. Ou seja, para digitar 'ê'
                              [Shift + 6] + E.
  -r, --revert                Desisntala o layout, revertendo os arquivos para o
                              estado anterior.
  -h, --help                  Help in english.
  -a, --ajuda                 Ajuda em português.
"
}

show_help_en() {
    printf "\033[1m US International Keyboard enhanced for the portuguese language \033[0m
This script can install up to three layout options.
All layouts make 'ã', 'õ' e 'ç' available at level 3 (AltGr) of the keys <F>,
<G> and <C> respectivelly. If none of the options are given, all three will be
installed
A backup of the xkb files will be created before installing.

Uso: ./install [OPÇÕES]
  -d, --deadkeys              Install a layout keeping the dead keys of the
                              default US-International layout. I.e., to type
                              'à', one must type [Shift + \`] + A.
  -t, --third-lv-deadkeys     US Intl. layout, but the deadkeys are transfered
                              to level 3. I.e., to type 'à', one must type
                              [AltGr + \`] + A.
  -c, --lv3-dead-lv2-circum   Same as the previous -t, but the circumflex is
                              kept on the second level. To type 'ê', one must
                              type [Shift + 6] + E.
  -r, --revert                Uninstalls the layout, reverting the backup files.
  -h, --help                  Help in english.
  -a, --ajuda                 Ajuda em português.
"
}

LAYOUT=()

if ! options=$( getopt -o rhadtc -l revert,help,ajuda,deadkeys,third-lv-deadkeys,lv3-dead-lv2-circum -n "$0" -- "$@" ); then
    echo "Incorrect options provided"
    exit 1
fi

eval set -- "$options"

while true; do
    case "$1" in
    --deadkeys|-d)
        LAYOUT+=('d')
        ;;
    --third-lv-deadkeys|-t)
        LAYOUT+=('t')
        ;;
    --lv3-dead-lv2-circum |-c)
        LAYOUT+=('c')
        ;;
    --revert|-r)
        revert
        exit 0
        ;;
    -h|--help)
        show_help_en
        exit 0
        ;;
    -a|--ajuda)
        show_help_pt
        exit 0
        ;;
    --)
        shift
        break
        ;;
    *)
        show_help_en
        exit 2
        ;;
    esac
    shift
done

if [[ -z ${LAYOUT[0]} ]]; then
    LAYOUT=('c' 'd' 't')
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

check_for_backups
create_backups

SYMBOLS_FILE="$XKB_PATH/symbols/us"

for OPT in "${LAYOUT[@]}"; do
    if [[ $OPT == "t" ]]; then

        FILE="$XKB_PATH/rules/evdev.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev_altgr.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base_altgr.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/evdev.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev_altgr.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base_altgr.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        cat "$SCRIPT_DIR/insert/altgr-intl-pt-improved" >> $SYMBOLS_FILE
        echo "Installed layout altgr-intl-pt-enhanced  us: English (pt. enhanced AltGr dead keys)"

    elif [[ $OPT == "d" ]]; then

        FILE="$XKB_PATH/rules/evdev.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/evdev.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        cat "$SCRIPT_DIR/insert/intl-pt-improved" >> $SYMBOLS_FILE
        echo "Installed layout intl-pt-enhanced us: English (pt. enhanced)"

    elif [[ $OPT == "c" ]]; then

        FILE="$XKB_PATH/rules/evdev.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev_altgr_dead-circumflex.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.xml"
        LINE=$(awk '/<name>us</{f=1} f && /<variantList>/ {print NR; exit}' /usr/share/X11/xkb/rules/evdev.xml)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base_altgr_dead-circumflex.xml" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/evdev.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/evdev_altgr_dead-circumflex.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        FILE="$XKB_PATH/rules/base.lst"
        LINE=$(grep -n -m 1 "! variant" "$FILE" | cut -f1 -d:)
        exit_if_empty "$LINE" "$FILE"
        insert_text_to_file "$FILE" "$SCRIPT_DIR/insert/base_altgr_dead-circumflex.lst" "$LINE" 1> /dev/null
        exit_on_error $? "$FILE"

        cat "$SCRIPT_DIR/insert/altgr-intl-pt-improved_dead-circumflex" >> $SYMBOLS_FILE
        echo "Instaled layout   altgr-intl-pt-enh-circum-lv2   us: English (intl., with AltGr dead keys plus a/otilde & circumflex lv2)"
    fi
done


echo "SUCCESS! Reboot to reload the keyboard layouts."

exit 0
