   Extensions to `isearch.el'.

 More description below.


 Index
 -----

 If you have library `linkd.el' and Emacs 22 or later, load
 `linkd.el' and turn on `linkd-mode' now.  It lets you easily
 navigate around the sections of this doc.  Linkd mode will
 highlight this Index, as well as the cross-references and section
 headings throughout this file.  You can get `linkd.el' here:
 http://dto.freeshell.org/notebook/Linkd.html.

 (@> "Overview of Features")
 (@> "Change log")
 (@> "Faces and Variables")
 (@> "Keys and Hooks")
 (@> "Commands")
 (@> "Non-Interactive Functions")
 (@> "Character-Property Search")


 Macros defined here:

   `isearchp-with-search-suspended' (Emacs 22+).

 Commands defined here:

   `isearchp-char-prop-backward',
   `isearchp-char-prop-backward-regexp',
   `isearchp-char-prop-forward',
   `isearchp-char-prop-forward-regexp',
   `isearchp-cycle-mismatch-removal',
   `isearchp-fontify-buffer-now', `isearchp-init-edit',
   `isearchp-insert-char-by-name', `isearchp-open-recursive-edit'
   (Emacs 22+), `isearchp-put-prop-on-region',
   `isearchp-retrieve-last-quit-search',
   `isearchp-set-region-around-search-target',
   `isearchp-toggle-invisible',
   `isearchp-toggle-regexp-quote-yank',
   `isearchp-toggle-set-region', `isearch-toggle-word',
   `isearchp-yank-sexp-symbol-or-char'.

 User options defined here:

   `isearchp-drop-mismatch', `isearchp-initiate-edit-commands'
   (Emacs 22+), `isearchp-mouse-2-flag',
   `isearchp-regexp-quote-yank-flag', `isearchp-set-region-flag'.

 Faces defined here:

   `isearch-fail'.

 Non-interactive functions defined here:

   `isearchp-char-prop-1', `isearchp-char-prop-default-match-fn',
   `isearchp-char-prop-end', `isearchp-char-properties-in-buffer',
   `isearchp-char-prop-filter-pred',
   `isearchp-char-prop-matches-p', `isearchp-fail-pos',
   `isearchp-highlight-lighter', `isearchp-message-prefix',
   `isearchp-message-suffix', `isearchp-read-face-names',
   `isearchp-read-face-names--read', `isearchp-read-sexps',
   `isearchp-remove-duplicates', `isearchp-remove-mismatch',
   `isearchp-set-region', `isearchp-set-sel-and-yank',
   `isearchp-some', `isearchp-update-edit-init-commands' (Emacs
   22+).

 Internal variables defined here:

   `isearchp-char-prop-prop', `isearchp-char-prop-type',
   `isearchp-char-prop-values', `isearchp-filter-predicate-orig',
   `isearchp-last-non-nil-invisible',
   `isearchp-last-quit-regexp-search', `isearchp-last-quit-search',
   `isearchp-win-pt-line'.


 ***** NOTE: The following functions defined in `isearch.el' have
             been REDEFINED OR ADVISED HERE:

 `isearch-abort'       - Save search string when `C-g'.
 `isearch-cancel'      - Restore cursor position relative to window.
 `isearch-edit-string' - Put point at mismatch position.
 `isearch-mode'        - Save cursor position relative to window.
 `isearch-mode-help'   - End isearch.  List bindings.
 `isearch-message'     - Highlight failed part of search string in
                         echo area, in face `isearch-fail'.
 `isearch-message-prefix' - Highlight prompt keywords:
                            wrapped, regexp, word, multi
 `isearch-mouse-2'     - Respect `isearchp-mouse-2-flag'(Emacs 21+)
 `isearch-printing-char' - Respect option `isearchp-drop-mismatch'
 `isearch-toggle-case-fold' - Show case sensitivity in mode-line.
                              Message.
 `isearch-toggle-word' - Message, and turn off regexp search.
 `isearch-update' (Emacs 20-23) - Run `isearch-update-post-hook'.
 `isearch-yank-string' - Respect `isearchp-regexp-quote-yank-flag'.


 The following bindings are made here for incremental search mode
 (`C-s' prefix):

   `C-`'        `isearchp-toggle-regexp-quote-yank'
   `C-+'        `isearchp-toggle-invisible'
   `C-_'        `isearchp-yank-symbol-or-char' (Emacs 22+)
   `C-('        `isearchp-yank-sexp-symbol-or-char' (Emacs 22+)
   `C-SPC'      `isearchp-toggle-set-region'
   `C-end'      `goto-longest-line' (requires `misc-cmds.el')
   `C-c'        `isearch-toggle-case-fold'
   `C-h'        `isearch-mode-help'
   `C-t'        `isearchp-char-prop-forward' (Emacs 23+)
   `C-x o'      `isearchp-open-recursive-edit' (Emacs 22+)
   `C-x 8 RET'  `isearchp-insert-char-by-name' (Emacs 23+)
   `M-e'        `isearch-edit-string'
   `M-g'        `isearchp-retrieve-last-quit-search'
   `M-k'        `isearchp-cycle-mismatch-removal'
   `M-r'        `isearch-toggle-regexp'
   `M-w'        `isearch-toggle-word'
   `C-M-t'      `isearchp-char-prop-forward-regexp' (Emacs 23+)
   `C-M-tab'    `isearch-complete' (on MS Windows)
   `next'       `isearch-repeat-forward'
   `prior'      `isearch-repeat-backward'


 User option `isearchp-initiate-edit-commands' causes certain keys
 not to exit Isearch but rather to edit the search string.
 Customize it to `nil' if you do not want this behavior at all.


 The following bindings are made here for incremental search edit
 mode:

   `C-x 8 RET'  `insert-char' (Emacs 23+)
   `C-M-tab'    `isearch-complete-edit' (MS Windows only)


 This file should be loaded *AFTER* loading the standard GNU file
 `isearch.el'.  So, in your `~/.emacs' file, do this:

 (eval-after-load "isearch" '(require 'isearch+))


(@* "Overview of Features")

Overview of Features ---------------------------------------------

 * Case-sensitivity is indicated in the mode line minor-mode
   lighter: `ISEARCH' for case-insensitive; `Isearch' for
   case-sensitive.

 * Highlighting of the mode-line minor-mode lighter when search has
   wrapped around (Emacs 24+ only).

 * Highlighting of parts of the prompt, to indicate the type of
   search: regexp, word, multiple-buffer, and whether searching has
   wrapped around the buffer (Emacs 22+ only).

 * Ability to search within character-property zones.  Example:
   search within zones having a `face' text property with a value
   of `font-lock-comment-face' or `font-lock-string-face'.  Search
   overlays or text properties.  From within Isearch: `C-t' (or
   `C-M-t' for regexp search).  First time, or with a prefix
   argument, you are prompted for the property and its values.  See
   the doc string of command `isearchp-char-prop-forward'.

 * Besides relying on other code to set `face' and other text
   properties for use with `C-t', you can use command
   `isearchp-put-prop-on-region' (outside of Isearch) to add a text
   property to a zone of text.  By default, it applies the last
   property and value whose zones you searched using `C-t', but a
   prefix arg lets you specify the property and value to apply.
   This gives you an interactive way to set up zones for
   text-property search (`C-t').  For property `face', empty input
   removes all faces from the region.

 * Option and commands to let you select the last target occurrence
   (set the region around it):

   - Option `isearchp-set-region-flag' - Non-`nil' means
     automatically set the region around the last search target.
   - Command `isearchp-toggle-set-region', bound to `C-SPC' during
     isearch - toggle `isearchp-set-region-flag'.
   - Command `set-region-around-search-target' - manually set the
     region around the last search target.

 * Option (`isearchp-regexp-quote-yank-flag') and command
   (`isearchp-toggle-regexp-quote-yank', bound to `C-`') to toggle
   quoting (escaping) of regexp special characters.  With escaping
   turned off, you can yank text such as `^\*.*' without it being
   transformed to `\^\\\*\.\*'.

 * `M-g' yanks the last successful search string (regexp or plain)
   from when you last hit `C-g' in Isearch.  Sometimes you search
   for something but abandon the search - you just want to check
   the locations of something, without staying at any of them.
   Afterward, if you want to find them again, use `M-g'.  This
   yanks that search string, so you can append it to whatever you
   are already searching for.

 * `C-M-y' yanks the secondary selection into the search string, if
   you also use library `second-sel.el'.

 * `C-_' yanks successive symbols (or words or chars) into the
   search string.

 * `C-(' yanks successive sexps (or symbols or words or chars) into
   the search string.

 * `C-x 8 RET' reads the name of a Unicode character with
   completion and appends it to the search string.  Same thing when
   editing the search string (i.e., after `M-e').

 * `C-x o' opens a recursive editing session, where you can do
   anything you like (including search for something different).
   Using `C-M-c' closes the recursive editing session and resumes
   the search (from the current position when you hit `C-M-c').

 * Highlighting of the mismatched portion of your search string in
   the minibuffer.  This is the portion that is removed if you do
   `C-g', or removed/replaced automatically if you use `M-k' (see
   next).  I added this feature to vanilla Emacs in release 23.1.

 * `C-g' after successfully finding matches restores not only the
   original position but also its relative position in the window.
   IOW, you get back to what you saw before searching.  Fixes Emacs
   bug #12253 for Isearch.

 * Command and binding to cycle automatic removal or replacement of
   the input portion that does not match, bound to `M-k'.  Behavior
   is controlled by the value of option `isearchp-drop-mismatch':

   `replace-last' - Your current input replaces the last mismatched
                    text.  You can always see your last input, even
                    if it is a mismatch.  And it is available for
                    editing using `M-e'.
   nil            - Your current input is appended, even if the
                    previous input has a mismatched portion.
   anything else  - Your current input is ignored (removed) if it
                    causes a mismatch.  The search string always
                    has successful matches.

 * Command and binding to toggle (incremental) word search:
   `isearch-toggle-word', bound to `M-w'.

 * Command and binding to toggle invisible-text sensitivity while
   searching: `isearchp-toggle-invisible, bound to `C-+'.

 * Bindings during Isearch (the standard bindings for some of these
   use the Meta modifier, `M-',  instead):

   - `next', `prior' repeat the last Isearch forward and backward
     (easier than using the chords `C-s', `C-r'.
   - `C-h' provides help on Isearch while isearsching.  This library
     also redefines `isearch-mode-help' so that it lists all
     Isearch bindings and ends Isearch properly
   - `C-c' lets you toggle case-sensitivity while isearching.
     (Standard binding is `M-c'.)
   - `C-+' lets you toggle invisible-text sensitivity while
     isearching.
   - `C-SPC' lets you toggle setting the region around the last
     found occurrence.
   - `C-end' - go to the longest line.  Repeat to go to the longest
     line following that one in the buffer.  As usual, `C-g' puts
     you back where you started.  This binding is made only if you
     also use `misc-cmds.el'.

 * `M-e' (`isearch-edit-string') automatically puts the cursor at
   the first mismatch position in the search string, for easy
   editing.  Whereas `C-g' (see also `M-k') removes all of the
   mismatch, this feature lets you change or insert a character or
   two, without losing the rest of the search string.

 * A user option, `isearchp-initiate-edit-commands', that specifies
   commands whose keys will not exit Isearch but will instead
   initiate editing of the search string.  For example, if
   `backward-char' is included in the list then `C-b' and `left'
   will just move the cursor backward over the search string so you
   can change, delete, or insert chars in the middle somewhere.
   This makes the search string more minibuffer-like.

 * You can, by default, select text with the mouse, then hit `C-s'
   etc. to search for it.  This is controlled by user option
   `isearchp-mouse-2-flag'.
