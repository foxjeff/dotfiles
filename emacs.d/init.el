;; init.el
;;

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;;=> ~/.emacs.d/

;; Keep emacs Custom-settings in separate file
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

(setq my-stuff (concat dotfiles-dir "my-stuff"))
(add-to-list 'load-path my-stuff)

;; Add external projects to load path
(dolist (project (directory-files my-stuff t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")

;; turn off annoying bell
(setq ring-bell-function 'ignore)

;; requires from my-stuff (non-package installs)
(require 'blink-colored-cursor)
(require 'rainbow-delimiters)
(require 'color-theme)
(eval-after-load "color-theme"
     (color-theme-initialize))

;; bring in color-themes, et al from Package installs
;; done in after hook because default package loads are done after init
;; unless package-initialize is called during init
(add-hook 'after-init-hook
          #'(lambda ()
              (require 'color-theme-actress)
							(require 'color-theme-blackboard)
							(require 'color-theme-monokai)
							(require 'color-theme-gruber-darker)
							(require 'color-theme-railscasts)
							(require 'centered-cursor-mode)
							(global-centered-cursor-mode)
							(color-theme-charcoal-black)  ;;dark, like light table
							))

(defalias 'yes-or-no-p 'y-or-n-p)

;; inspired by Erik Naggum's `recursive-edit-with-single-window'
(defmacro recursive-edit-preserving-window-config (body)
	"*Return a command that enters a recursive edit after executing BODY.
    Upon exiting the recursive edit (with\\[exit-recursive-edit] (exit)
	  or \\[abort-recursive-edit] (abort)), restore window configuration
	  in current frame."
	`(lambda ()
		"See the documentation for `recursive-edit-preserving-window-config'."
      (interactive)
      (save-window-excursion
        ,body
        (recursive-edit))))

;; Use it like this:
(global-set-key (kbd "C-c 0") (recursive-edit-preserving-window-config (delete-window)))
(global-set-key (kbd "C-c 1") (recursive-edit-preserving-window-config
															 (if (one-window-p 'ignore-minibuffer)
																	 (error "Current window is the only window in its frame")
																 (delete-other-windows))))

;; these need some investigating
(ido-mode 1)
 (setq ido-enable-flex-matching t)
 (setq ido-everywhere t)

;; not sure i need these with emacs 24.2
;; DO need these; move w3m dependencies from site-lisp to my-stuff
;; (require 'w3m-load)
;;  (setq w3m-use-cookies 1)
;;  (setq browse-url-browser-function 'w3m-browse-url)
;;  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;  ;;optional keyboard short-cut
;;  (global-set-key "\C-xm" 'browse-url-at-point)

;; org-mode templates
(setq org-capture-templates
      '(("n" "New Note" item (file "~/Dropbox/work/org-mode/new-notes.org")
             "- %?  %U\n %i\n %a")
				("t" "Todo" entry (file+headline "~/Dropbox/work/org-mode/new-notes.org" "Tasks")
             "* TODO %?\n  %i\n  %a")))

;; org-mode capture
(global-set-key (kbd "C-c c") 'org-capture)

;; iy-go-to-char.el -- like "f" in vim
(require 'iy-go-to-char)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

;; some convenience set-keys
(global-set-key (kbd "C-x e") 'end-of-buffer)
(global-set-key (kbd "C-x t") 'beginning-of-buffer)

(global-set-key (kbd "<f1>") '(lambda () (interactive) (ido-switch-buffer)))
(global-set-key (kbd "<f2>") '(lambda () (interactive) (other-window 1)))

;; other-window "quit" function
(defun quit-other-window ()
	"switch to other-window, quit it"
	(interactive)
	(other-window 1)
	;(insert-char (string-to-char "q") 1)
	(command-execute "q")
	)
(global-set-key (kbd "C-c q") '(lambda () (interactive) (quit-other-window)))

;(global-linum-mode 1)

