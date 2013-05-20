Quickstart:

    Configure an extended Latin font for your default face, such
    as Monaco, Consolas, or DejaVu Sans Mono.

    Install these fonts

       http://users.teilar.gr/~g1951d/Symbola702.zip
       http://www.quivira-font.com/files/Quivira.ttf
       http://sourceforge.net/projects/dejavu/files/dejavu/2.33/dejavu-fonts-ttf-2.33.tar.bz2

    Remove Unifont from your system.

    (require 'unicode-fonts)

    (unicode-fonts-setup)

Testing:

    C-h h                                         ; M-x view-hello-file
    M-x list-charset-chars RET unicode-bmp RET    ; search for 210x
    M-x list-charset-chars RET unicode-smp RET    ; if your backend supports astral chars
    M-x unicode-fonts-debug-insert-block RET Mathematical_Operators RET

Explanation:

Emacs maintains font mappings on a per-glyph basis, meaning
that multiple fonts are used at the same time (transparently) to
display any character for which you have a font.  Furthermore,
Emacs does this out of the box.

However, font mappings via fontsets are a bit difficult to
configure.  In addition, the default setup does not always pick
the most legible fonts.  As the manual warns, the choice of font
actually displayed for a non-ASCII character is "somewhat random".

The Unicode standard provides a way to organize font mappings: it
divides character ranges into logical groups called "blocks".  This
library configures Emacs in a Unicode-friendly way by providing
mappings from

    each Unicode block  ---to--->   a font with good coverage

and makes the settings available via the customization interface.

To use unicode-fonts, place the unicode-fonts.el file somewhere
Emacs can find it, and add the following to your ~/.emacs file:

    (require 'unicode-fonts)
    (unicode-fonts-setup)

See important notes about startup speed below.

To gain any benefit from the library, you must have fonts with good
Unicode support installed on your system.  If you are running a
recent version of OS X or Microsoft Windows, you already own some
good multi-lingual fonts, though you would do very well to download
and install the four items below:

From http://dejavu-fonts.org/wiki/Download

    DejaVu Sans, DejaVu Sans Mono

From http://www.quivira-font.com/downloads.php

    Quivira

From http://users.teilar.gr/~g1951d/

    Symbola

Many non-free fonts are referenced by the default settings.
However, free alternatives are also given wherever possible, and
patches are of course accepted to improve every case.

On the assumption that an extended Latin font such as Monaco,
Consolas, or DejaVu Sans Mono is already being used for the default
face, no separate mappings are provided for the following Unicode
blocks:

    Latin Extended Additional
    Latin Extended-A
    Latin-1 Supplement
    Spacing Modifier Letters

It is also recommended to remove GNU Unifont from your system.
Unifont is very useful for debugging, but not useful for reading.

The default options favor correctness and completeness over speed,
and can add many seconds to startup time in GUI mode.  Note that
when possible a font cache is kept between sessions, so try
starting Emacs a second time to see the true startup cost.  To
further increase startup speed, enter the customization interface
and

    1. Remove fonts from `unicode-fonts-block-font-mapping'
       which are not present on your system.

    2. Disable blocks in `unicode-fonts-block-font-mapping'
       which you are not interested in displaying.

If you are using a language written in Chinese or Arabic script,
try customizing `unicode-fonts-skip-font-groups' to control which
script you see, and send a friendly bug report.

See Also

    M-x customize-group RET unicode-fonts RET
    M-x customize-variable RET unicode-fonts-block-font-mapping RET

Notes

Free fonts recognized by this package may be downloaded
from the following locations:

    From http://scripts.sil.org/cms/scripts/page.php?item_id=DoulosSIL_download

        Doulos SIL                    ; Extended European and diacritics

    From http://scripts.sil.org/cms/scripts/page.php?item_id=Gentium_download

        Gentium Plus                  ; Greek

    From http://users.teilar.gr/~g1951d/

        Aegean, Aegyptus, Akkadian    ; Ancient languages
        Analecta                      ; Ancient languages, Deseret
        Musica                        ; Musical Symbols

    From http://www.wazu.jp/gallery/views/View_MPH2BDamase.html

        MPH 2B Damase                 ; Arabic, Armenian, Buginese, Cherokee, Georgian,
                                      ; Glagolitic, Hanunoo, Kharoshthi, Limbu, Osmanya,
                                      ; Shavian, Syloti Nagri, Tai Le, Thaana

    From http://wenq.org/enindex.cgi?Home

        WenQuanYi Zen Hei             ; CJK (Simplified Chinese)

    From http://babelstone.co.uk/Fonts/

        BabelStone Han                ; CJK (Simplified Chinese)
        BabelStone Phags-pa Book      ; Phags-pa

    From http://kldp.net/projects/unfonts/

        Un Batang                     ; CJK (Hangul)

    From http://sourceforge.jp/projects/hanazono-font/releases/

        Hana Min A, Hana Min B        ; CJK (Japanese)

    From http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=SILYi_home

        Nuosu SIL                     ; CJK (Yi)

    From http://www.daicing.com/manchu/index.php?page=fonts-downloads

        Daicing Xiaokai               ; Mongolian

    From http://www.library.gov.bt/IT/fonts.html

        Jomolhari                     ; Tibetan

    From http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=

        Padauk                        ; Myanmar

    From http://sarovar.org/projects/samyak/

        Samyak                        ; Devanagari, Gujarati, Malayalam, Oriya, Tamil

    From http://guca.sourceforge.net/typography/fonts/anmoluni/

        AnmolUni                      ; Gurmukhi

    From http://brahmi.sourceforge.net/downloads2.html

        Kedage                        ; Kannada

    From http://www.omicronlab.com/bangla-fonts.html

        Mukti Narrow                  ; Bengali

    From http://www.kamban.com.au/downloads.html

        Akshar Unicode                ; Sinhala

    From http://tabish.freeshell.org/eeyek/download.html

        Eeyek Unicode                 ; Meetei Mayek

    From http://scripts.sil.org/CMS/scripts/page.php?&item_id=Mondulkiri

        Khmer Mondulkiri              ; Khmer

    From http://www.laoscript.net/downloads/

        Saysettha MX                  ; Lao

    From http://www.geocities.jp/simsheart_alif/taithamunicode.html

        Lanna Alif                    ; Tai Tham

    From http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=DaiBannaSIL

        Dai Banna SIL                 ; New Tai Lue

    From http://scripts.sil.org/cms/scripts/page.php?item_id=TaiHeritage

        Tai Heritage Pro              ; Tai Viet

    From http://sabilulungan.org/aksara/

        Sundanese Unicode             ; Sundanese

    From http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=ArabicFonts

        Scheherazade                  ; Arabic

    From http://www.farsiweb.ir/wiki/Persian_fonts

        Koodak                        ; Arabic (Farsi)

    From http://openfontlibrary.org/font/ahuramazda/

        Ahuramzda                     ; Avestan

    From http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=AbyssinicaSIL

        Abyssinica SIL                ; Ethiopic

    From http://www.bethmardutho.org/index.php/resources/fonts.html

        Estrangelo Nisibin            ; Syriac

    From http://www.evertype.com/fonts/nko/

        Conakry                       ; N'ko

Compatibility and Requirements

    GNU Emacs version 24.3-devel     : yes, at the time of writing
    GNU Emacs version 24.1 & 24.2    : yes
    GNU Emacs version 23.3           : yes
    GNU Emacs version 22.3 and lower : no

    Requires font-utils.el, ucs-utils.el

Bugs

    The default choice of font for each code block balances coverage
    versus appearance.  This is necessarily subjective.

    Checking for font availability is slow.  This library can
    add anywhere between 0.1 - 10 secs to startup time.  It is
    slowest under X11.  Some per-architecture limitations are
    documented in font-utils.el

    Calling `set-fontset-font' can easily crash Emacs.  There is a
    workaround, but it may not be sufficient on all platforms.
    Tested on Cocoa Emacs, Native Mac Emacs, X11/XQuartz,
    MS Windows XP.

    Glyph-by-glyph fallthrough happens differently depending on the
    font backend.  On Cocoa Emacs, glyph-by-glyph fallthrough does not
    occur, and manual per-glyph overrides are required to maximize
    coverage.  Fallthrough works on MS Windows, but not perfectly.
    X11/FreeType behaves most predictably.

    The following ranges cannot be overridden within the
    "fontset-default" fontset:

        Latin Extended Additional
        Latin Extended-B
        Spacing Modifier Letters

    `unicode-fonts-overrides-mapping' shows some order-dependence,
    which must indicate a bug in this code.

    A number of the entries in `unicode-fonts-overrides-mapping'
    are workarounds for the font Monaco, and therefore specific
    to OS X.

    Widths of alternate fonts do not act as expected on MS Windows.
    For example, DejaVu Sans Mono box-drawing characters may use
    a different width than the default font.

TODO

    @@@@@@@ test again on windows with new font-utils

    (set-language-environment "UTF-8") ?

    add coverage comments to all mapping entries

    Remove very old Microsoft entries (eg Monotype.com which was
    renamed Andale)

    Recognize the default font and make smarter choices when it is
    one of the provided mappings.  (On Cocoa, the default font is
    returned when font-info fails, which is not a good thing
    overall.)

    For every font, list font version and unicode blocks which are
    complete.

    Note all decorative fonts

    Get Windows 8 font listing

    Adobe international fonts which are supplied with Reader

    Apple fonts which could not be mapped
        Wawati TC
        Weibei TC
        Weibei SC
        Wawati SC

License

Simplified BSD License:

Redistribution and use in source and binary forms, with or
without modification, are permitted provided that the following
conditions are met:

   1. Redistributions of source code must retain the above
      copyright notice, this list of conditions and the following
      disclaimer.

   2. Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials
      provided with the distribution.

This software is provided by Roland Walker "AS IS" and any express
or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular
purpose are disclaimed.  In no event shall Roland Walker or
contributors be liable for any direct, indirect, incidental,
special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of
use, data, or profits; or business interruption) however caused
and on any theory of liability, whether in contract, strict
liability, or tort (including negligence or otherwise) arising in
any way out of the use of this software, even if advised of the
possibility of such damage.

The views and conclusions contained in the software and
documentation are those of the authors and should not be
interpreted as representing official policies, either expressed
or implied, of Roland Walker.

No rights are claimed over data created by the Unicode
Consortium, which are included here under the terms of
the Unicode Terms of Use.
