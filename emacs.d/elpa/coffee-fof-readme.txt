Introduction:

A `ff-find-other-file' wrapper for coffee-mode.el.

Find the CoffeeScript or JavaScript file corresponding to this file.


Requirements:

* `coffee-mode'
* `js-mode', `js2-mode' or `js3-mode'


Usage:

* coffee-find-other-file: `C-c f'

  Find the CoffeeScript or JavaScript file corresponding to this
  file.  This command is enabled in `coffee-mode', `js-mode',
  `js2-mode', `js3-mode'.


Configuration:

Add the following to your Emacs init file unless using ELPA package:

    (require 'coffee-fof) ;; Not necessary if using ELPA package
    (coffee-fof-setup-key)

If the .coffee files and .js files are in the same directory, a
configuration is not necessary as default value of
coffee-fof-search-directories is '(".").

If the .coffee and .js files are in different directories, for
example, .js files are in `js` directory and .coffee files are in
`coffee` directory as below, customize
`coffee-fof-search-directories`.

    .
    ├── coffee
    │   └── example.coffee
    └── js
        └── example.js


    (custom-set-variables
     '(coffee-fof-search-directories
      '("." "../*")))

If you want to set another key binding, configure as follow.

    (coffee-fof-setup-key (kbd "C-c C-f"))
