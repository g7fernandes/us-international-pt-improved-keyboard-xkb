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

### US Intl. Portuguese enhanced with AltGr Dead Keys

The same modifications as done in the *US Intl. Portuguese Enhanced*, but is based on the *us (intl) English (intl., with AltGr dead keys)* layout, that moves all accents to the third level. This is very useful for people that use quotes and double quotes frequently.

The most frequent accentuated letters (a tilde and acutes) are available on the third level (AltGr) in this layout, therefore they can be typed with the combination of two keys. Typing quotes, acute, circumflex and grave will not require typing space in the first level. 

The disadvantage is that the dead circumflex still need combination, now with <kbd>AltGr</kbd> (which is a bit harder to reach) instead of <kbd>Shift</kbd>, and the dead grave will require combination with <kbd>AltGr</kbd> as well. But these are not very common.

The dead tilde, dead acute and dead diaeresis can be typed using <kbd>AltGr</kbd> plus the usual keys.  

### US Intl. Portuguese enhanced with AltGr Dead Keys except circumflex

The same as *US Intl. Portuguese enhanced with AltGr Dead Keys*, except that the circumflex is dead key in the second level, as in the default US Intl. layout. 

## Installation

Clone this repository and execute the `install.sh` with `-h`to see the options. The options are for choosing whith layout(s) to install. If no option is passed, all three layouts will be installed.

```bash
cd us-international-pt-improved-keyboard-xkb
./install.sh -h
```

The script inserts the layouts in the `base.lst`, `evdev.lst, `base.xml`, `evdev.xml`` and `symbols/us` files. The script creates backups of the original XKB files that must be modified and can restore them later if you wish. 

After installing, restart the session or reboot the computer, and the layout will be available in the GUI settings of your desktop environment. 

[Using an alternative keyboard layout in Gnome](https://help.gnome.org/users/gnome-help/stable/keyboard-layouts.html.en)

[Using an alternative keyboard layout in KDE](https://userbase.kde.org/System_Settings/Keyboard)

## Development

The proposed layouts in the **main branch** of this repository must follow the guidelines:

* Facilitate typing the accentuated vowels of the portuguese language, that is avoid 3-key-combinations or hard to reach keys;
* The symbols typed in the first level should correspond to the label in the key of the physical ANSI keyboard;
* All phonetic symbols available on the *English (intl.)* must be also availabe in there;
* Keep, when possible, the phonetic symbols of the languages (that use latin alphabet) with largest number of speakers where they are in the  *English (intl.)* layout;
* Keep, when possible, the accents under the same key as labeled in the phisical ANSI keyboard.

# Layout do Teclado EUA Internacional melhorado para a Língua Portuguesa

