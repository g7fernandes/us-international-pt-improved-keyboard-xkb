# US International Keyboard Layout Enhanced for the Portuguese Language

These keyboard layouts are intended to facilitate the typing in portuguese in ANSI keyboards.

The proposed layouts are small variations of the default US *English (intl)* and US *English (intl., with AltGr dead keys)* distributed with the most popular Linux distros. These layouts should be easy for users accustomed to the US English layout to use.

## Motivation

The tilde is the most used accentuation in Portuguese, and yet it requires the combination of three keys to be typed in the ANSI keyboard using the US English international layout. The table 1. shows the number of occurences of each acentuation in the books *Dom Casmurro - Machado de Assis*, *Memorial do Convento - José Saramago*, and *Comédias para se ler na escola - Luis Fernando Verissimo*.

Table 1: Occurences of accentuated letters in Portuguese based on the cited books.
| Accent | Occurrences | % of all accentuations |
| - | ---- | ------ |
| ã | 8959 | 29,64% |
| á | 4808 | 15,91% |
| é | 4657 | 15,41% |
| ç | 3785 | 12,52% |
| ó | 1978 | 6,54%  |
| í | 1812 | 6,00%  |
| ê | 1419 | 4,70%  |
| à | 1040 | 3,44%  |
| ú | 620  | 2,05%  |
| õ | 601  | 1,99%  |
| ô | 327  | 1,08%  |
| â | 216  | 0,71%  |

In the US Intl. layout, the acute accents can be easily typed using the apostrophe key as dead acute *or* with the third level <kbd>AltGr</kbd> plus the corresponding vowel. The c cedilla _ç_ can be writen by "accentuating" the _c_ the dead acute, but its place in the third level is the not very ergonomic <kbd>AltGr</kbd> + <kbd>,</kbd>.

The third level of the keys of the letters <kbd>F</kbd>, <kbd>G</kbd>, <kbd>H</kbd> and <kbd>J</kbd> are vacant, since they hold the same characters of the first level in the US Intl. layout.

## The Layouts

### US Intl. Portuguese Enhanced

The ã, õ, and c cedilha were mapped as follows.

ã → <kbd>AltGr</kbd> + <kbd>F</kbd>

õ → <kbd>AltGr</kbd> + <kbd>G</kbd>

ç → <kbd>AltGr</kbd> + <kbd>c</kbd>

Since the *ã* is very common, it is located under the third level of the letter **F** (key `<AC04>`). The *õ* is next to it under key ther third level of **G** (key `<AC05>`). Althouth not very common, it still would require the combination of at least three keys using the dead tilde. The *ç* was placed under the third level of **C** (key  `key <AB03>`), as it is found in the MacOS keyboard. Placing it there is more intuitive, some other layouts like [UK extended](https://en.wikipedia.org/wiki/QWERTY#United_Kingdom_(Extended)_Layout) have the c cedilla there.

![Layout Preview](/pics/us-intl.png "US Intl. Portuguese Enhanced Preview")

Although the preview shows a ISO layout, this layout is intended for ANSI (but you can use on iso, or course).

### US Intl. Portuguese enhanced with AltGr Dead Keys

This layout is based on another layout distributed on popular linux distros, whose author arguments that it is easier (or at least it takes the same effort) to type using the already available accentuated letters under the third level of some keys then using dead keys. Programmers and people that use quotes and double quotes frequently may find this layout very useful, since the symbols `\` ~ ' " ^` will neither require pressing <kbd>space</kbd> to be inserted, nor combination with the <kbd>AltGr</kbd>.

This layout has same modifications as done in the *US Intl. Portuguese Enhanced*, but is based on the *us (intl) English (intl., with AltGr dead keys)* layout, that moves all accents to the third level.

The most frequent accentuated letters (a tilde and acutes) are available on the third level (AltGr) in this layout, therefore they can be typed with the combination of two keys. Typing quotes, acute, circumflex and grave will not require typing space in the first level.

The disadvantage is that the dead circumflex still need combination, now with <kbd>AltGr</kbd> (which is a bit harder to reach) instead of <kbd>Shift</kbd>, and the dead grave will require combination with <kbd>AltGr</kbd> as well. But these are not very common.

The dead tilde, dead acute and dead diaeresis can be typed using <kbd>AltGr</kbd> plus the usual keys.

(Maybe this layout could be officially distributed replacing the current  US Intl. AltGr?)

![Layout Preview](/pics/us-intl-altgr.png "US Intl. Portuguese Enhanced with AltGr Dead Keys Preview")

Although the preview shows a ISO layout, this layout is intended for ANSI (but you can use on iso, or course).

### US Intl. Portuguese enhanced with AltGr Dead Keys except circumflex

The same as *US Intl. Portuguese enhanced with AltGr Dead Keys*, except that the circumflex is dead key in the second level, as in the default US Intl. layout. The key <kbd>6</kbd> is already hard to reach, and the circumflex is not very common in programming languages. Since <kbd>shift</kbd> is a bit easier to reach, it is justifiable to keep it dead on the second level.

### US (standard QWERTY) with Colemak's 3rd level dead keys and UTF-8 symbols

This layout is a US (english) QWERTY, but dead keys and some UTF-8 symbols, common in international layouts, are present in the 3rd level (AltGr) as it is in the Colemak keyboard. For example, the circumfle**x** accent is under the third level of the keys of the letter <kbd>X</kbd> of the US layout: [<kbd>AltGr</kbd> + <kbd>X</kbd>] + <kbd>A</kbd> → â.


![Layout Preview](pics/qwery_us_colemak_altgr.png "English (intl. qwerty with colemak's algtrs)")

Some notable advantages of this layout is that the some accents like circumflex and in a shorter reach in comparison with the previous layouts. The _õ_ is also more accessible in relation to the US Intl. AltGr portuguese enhanced.

The dead keys are in easy to remember positions:

* (ŭ) **B**reve - AltGr+[b]
* (ç) cedilla - AltGr+[,]
* (ü) **D**iaeresis (umlaut) - AltGr+[d]
* (ú) acu**T**e - AltGr+[t]
* (ű) double acute - AltGr+Shift+[t]
* (ù) g**R**rave - AltGr+[r]
* (ǔ) **H**áček (caron) - AltGr+[h]
* (ų) o**G**onek - AltGr+[g]
* (ū) **M**acron - AltGr+[m]
* (ũ) **tilde** - AltGr+[`]
* (ů) ring - AltGr+[k]
* (ċ) dot (.) - AltGr+[.]
* (û) circumfle**X** - AltGr+[x]
* Special characters - AltGr+[\] (only MS Windows/Mac)

More information about [Colemak multilingual support here](https://colemak.com/Multilingual).

The <xkb>CAPS</xkb> key keeps being CAPSLOCK.

## Installation

### On Linux

Clone this repository and execute the `install.sh` with `-h`to see the options. The options are for choosing whith layout(s) to install. If no option is passed, all three layouts will be installed.

```bash
cd us-international-pt-improved-keyboard-xkb
./install.sh -h
```

The script inserts the layouts in the `base.lst`, `evdev.lst, `base.xml`, `evdev.xml`` and `symbols/us` files. The script creates backups of the original XKB files that must be modified and can restore them later if you wish.

After installing, restart the session or reboot the computer, and the layout will be available in the GUI settings of your desktop environment.

[Using an alternative keyboard layout in Gnome](https://help.gnome.org/users/gnome-help/stable/keyboard-layouts.html.en)

[Using an alternative keyboard layout in KDE](https://userbase.kde.org/System_Settings/Keyboard)

### On Microsoft Windows

The source code for the Microsoft Layout Creator is available under the `Microsoft_Layouts` directory. You can create your own DLLs with the [Microsoft Layout Creator](https://www.microsoft.com/en-us/download/details.aspx?id=102134), or you can install directly the layouts using the MSI installer that I'm supplying under `Microsoft_Layouts/<name_of_the_layout>/Microsoft_Package`.

## Development

The proposed layouts in the **main branch** of this repository must follow the guidelines:

* Facilitate typing the accentuated vowels of the portuguese language, that is avoid 3-key-combinations or hard to reach keys;
* The symbols typed in the first level should correspond to the label in the key of the physical ANSI keyboard;
* All phonetic symbols available on the *English (intl.)* must be also availabe in there;
* Keep, when possible, the phonetic symbols of the languages (that use latin alphabet) with largest number of speakers where they are in the  *English (intl.)* layout;
* Keep, when possible, the accents under the same key as labeled in the phisical ANSI keyboard.

## Relate projects

* [German Portuguese Keyboard Layout](https://github.com/g7fernandes/german-portuguese-keyboard-xkb). Layout for iso-de keyboards improved for portuguese.

# Layout do Teclado EUA Internacional melhorado para a Língua Portuguesa
