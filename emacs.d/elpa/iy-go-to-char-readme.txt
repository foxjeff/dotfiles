This package defines the function `iy-go-to-char' which behaves
like "f" in vim. It reads a char and go the next Nth occurence of
the char. User can continue such search using that char key.

To use, make sure this file is on your `load-path' and put the
following in your .emacs file:

    (require 'iy-go-to-char)

Then you can bind functions like:

    (global-set-key (kbd "C-c f") 'iy-go-to-char)
    (global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
    (global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
    (global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

Except repeating the char key, followings keys are defined before
quitting the search:

   ;   -- search forward the char, customizable:
          `iy-go-to-char-key-forward'

   ,   -- search backward the char, customizable:
          `iy-go-to-char-key-backward'

   C-g -- quit

   C-s -- start `isearch-forward' using char as initial search
          string

   C-r -- start `isearch-backward' using char as initial search
          string

   C-w -- quit and kill region between start and current point. If region is
          activated before search, then use the original mark instead of the
          start position.

   M-w -- quit and save region between start and current point. If region is
          activated before search, use the mark instead of start position.

All other keys will quit the search. Then the key event is
intepreted in the original environment before search.

if the search quits because of error or using "C-g", point is set
back to the start position. Otherwise, point is not change and the
start position is set as marker. So you can use "C-x C-x" back to
that position.

`iy-go-to-char-backward' search backward by default. Also the search can
cross lines. To continue search last char, use `iy-go-to-char-continue' and
`iy-go-to-char-continue-backward'.
