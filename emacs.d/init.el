
;;
;; 16-mar-2013 in the customize ns group, changed command to be meta and alt to be control
;; 11-apr-2013 clean up

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;;=> ~/.emacs.d/

;; Keep emacs Custom-settings in separate file
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

(setq my-stuff (concat dotfiles-dir "my-stuff"))
(add-to-list 'load-path my-stuff)

;; Add external projects living under my-stuff to load path
(dolist (project (directory-files my-stuff t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")

;; turn off annoying bell
(setq ring-bell-function 'ignore)

;; requires from my-stuff (non-package installs)
;;;(require 'blink-colored-cursor) ;;CRASHes 24.3
;;(require 'rainbow-delimiters)

;; invokes the osx program Dash for documentation browsing
(autoload 'dash-at-point "dash-at-point"
             "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
;;(add-to-list 'dash-at-point-mode-alist '(haskell-mode . "haskell"))

;; from magnar's http://whattheemacsd.com/setup-ido.el-02.html
(add-hook 'ido-setup-hook
 (lambda ()
   ;; Go straight home
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (if (looking-back "/")
           (insert "~/")
         (call-interactively 'self-insert-command))))))

;; done in after hook because default package loads are done after init
;; unless package-initialize is called during init
(add-hook 'after-init-hook
          #'(lambda ()
              ;(when (not package-archive-contents) ;; only called during a fresh install
              ;   (package-refresh-contents))
              (require 'smooth-scrolling)
              ;;(require 'js3-mode)
              ;; JavaScript
              (autoload 'js3-mode "js3-mode" nil t)
              (font-lock-add-keywords
               'js3-mode `(("\\(function\\) *("
                            (0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "\u0192")
                                      nil)))))

              ;; Use right arrow for return in one-line functions
              (font-lock-add-keywords
               'js3-mode `(("function *([^)]*) *{ *\\(return\\) "
                            (0 (progn (compose-region (match-beginning 1)
                                                      (match-end 1) "\u2192")
                                      nil)))))
              (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
              (add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
              (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js3-mode))

              ;; markdown mode stuff
              (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
              (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

              ;; pure evil!
              (require 'evil)
              (require 'evil-leader)
              (global-evil-leader-mode)
              (evil-mode -1)
              (evil-leader/set-key
                "e" 'ido-find-file
                "f" 'ido-find-file
                "b" 'ido-switch-buffer
                "w" 'save-buffer
                "s" 'save-buffer
                "z" 'ido-switch-buffer-other-window
                "x" 'ido-display-buffer
                "o" 'evil-window-prev
                "p" 'mode-line-other-buffer  ;evil-buffer
                "c" 'evilnc-comment-or-uncomment-lines
                )
              ;; get rid of the default so leader works in all modes
              ;; in <E> mode, use C-\
              ;; note that in <M> mode the first "\" goes to <E>, then C-\ works
              (global-set-key (kbd "C-\\") nil)

              ;; clear these for macsy things i'm way to used to
              (define-key evil-motion-state-map (kbd "C-e") nil)
              (define-key evil-insert-state-map (kbd "C-e") nil)
              (define-key evil-insert-state-map (kbd "C-d") nil)
              (define-key evil-insert-state-map (kbd "C-k") nil)
              (define-key evil-insert-state-map (kbd "C-y") nil)
              (define-key evil-insert-state-map (kbd "C-v") 'evil-visual-char)
              ;; paired with C-y for evil-scroll-line-up
              (define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-line-down)
              (define-key evil-motion-state-map (kbd "C-d") 'evil-scroll-line-down)
              (define-key evil-motion-state-map (kbd "space") 'evil-scroll-page-down)
              (define-key evil-normal-state-map " " 'evil-scroll-page-down)

              ;; well, hello
              (require 'key-chord)
              ;;(key-chord-mode 1)
              (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
              (key-chord-define evil-insert-state-map "ww" 'save-buffer)
              (key-chord-define evil-insert-state-map "uu" 'undo-tree-undo)

              (evil-leader-mode)

              ;; web-mode
              ;; also, keyword-face is changed in custom.el
              (require 'web-mode)
              (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
              (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

              ;; themes -- color
              ;; (load-theme 'whiteboard2 t)
              ;; (load-theme 'gruber-darker t)
              (load-theme 'sanityinc-tomorrow-night t)
              ;; (load-theme 'afternoon t)
              ;; (load-theme 'ample-light t)
              ;;(load-theme 'solarized-light t)
              ;; (load-theme 'mesa t)
              ;;(load-theme 'eink t)
              ;; (menu-bar-mode -1)

              (require 'ido-vertical-mode)
              (require 'ido-ubiquitous)
              ;; turn ido-mode on: ido-??? set in custom
              (ido-mode 1)
              (ido-vertical-mode 1)
              (ido-ubiquitous-mode)

              (smex-initialize)
              (global-set-key (kbd "M-x") 'smex)
              (global-set-key (kbd "M-X") 'smex-major-mode-commands)
              ;; This is your old M-x.
              (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

              ;; added to custom -- not so much
              (set-face-attribute 'default nil :font "Menlo Regular-12")
              ;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-12")
              (setq-default line-spacing 1)

              ;; smart-mode-line
              (setq sml/theme 'dark)
              (require 'smart-mode-line)
              (sml/setup)
              (add-to-list 'sml/replacer-regexp-list '("^~/Projects/" ":Proj:"))

              (require 'my-setup)
              ))

;; C-h inside of searching
(define-key isearch-mode-map [(control h)] 'isearch-mode-help)

;; jump-to-mark
;;
(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)

(defalias 'yes-or-no-p 'y-or-n-p)

;; org-mode templates
(setq org-capture-templates
      '(("n" "New Note" item (file "~/Dropbox/work/org-mode/new-notes.org")
         "- %?  %U\n %i\n %a")
        ("t" "Todo" entry (file+headline "~/Dropbox/work/org-mode/new-notes.org" "Tasks")
         "* TODO %?\n  %i\n  %a")))

;; org-mode capture
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq org-completion-use-ido 1)
(setq org-agenda-files (list "~/Projects/Notes/basic-astrology.org"
                             "~/Projects/Notes/new-notes.org"
                             "~/Dropbox/work/org-mode/emacs-todo.org"))

;; kill buffer other-window
;; for when help or whatever obliterates your nice other-window
(global-set-key (kbd "C-c k") (lambda ()
                                "kill buffer in other-window"
                                (interactive)
                                (kill-buffer(window-buffer(next-window)))))

;; some convenience set-keys
(global-set-key (kbd "C-x e") 'end-of-buffer)
(global-set-key (kbd "C-x t") 'beginning-of-buffer)

;; 20-march-2013 -- displays buffer via ido-buffer in other window
;; differs from C-x 4 b in that it doesn't switch to other window
(global-set-key (kbd "C-x 4 o") 'display-buffer) 

;; for showing line numbers in the left gutter
;(global-linum-mode 1)

;; don't know where i got this:
(put 'dired-find-alternate-file 'disabled nil)

;; suggestions from magnar's init.el

;(recentf-mode 1)
;(setq recentf-max-saved-items 100) ;; just 20 is too rec
;; Save a list of recent files visited. (open recent file with C-x f)
;(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; got this from: http://stackoverflow.com/questions/14449598/bind-in-emacs-to-some-simpler-key
(add-hook 'dired-mode-hook
          (lambda () (define-key dired-mode-map (kbd "e")
                       (lambda () (interactive) (find-alternate-file "..")))))

(server-start)

;; liking isearch-occur
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dead stuff
;;
;; inspired by Erik Naggum's `recursive-edit-with-single-window'
;; (defmacro recursive-edit-preserving-window-config (body)
;; 	"*Return a command that enters a recursive edit after executing BODY.
;;     Upon exiting the recursive edit (with \\[exit-recursive-edit] (exit)
;; 	  or \\[abort-recursive-edit] (abort)), restore window configuration
;; 	  in current frame."
;; 	`(lambda ()
;; 		"See the documentation for `recursive-edit-preserving-window-config'."
;;       (interactive)
;;       (save-window-excursion
;;         ,body
;;         (recursive-edit))))
;;
;; **suspect** Use it like this:
;; i don't use these
;(global-set-key (kbd "C-c 0") (recursive-edit-preserving-window-config (delete-window)))
;(global-set-key (kbd "C-c 1") (recursive-edit-preserving-window-config
                               ;(if (one-window-p 'ignore-minibuffer)
                                   ;(error "Current window is the only window in its frame")
                                 ;(delete-other-windows))))
;; (global-set-key (kbd "M-j")
;;             (lambda ()
;;                   (interactive)
;;                   (join-line -1)))
;; Make dired less verbose
;;(require 'dired-details)
;;(setq-default dired-details-hidden-string "--- ")
;;(dired-details-install)

;; added to custom -- not so much
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-13")

;; never use these
;(global-set-key (kbd "<f1>") '(lambda () (interactive) (ido-switch-buffer)))
;(global-set-key (kbd "<f2>") '(lambda () (interactive) (other-window 1)))

;; iy-go-to-char.el -- like "f" in vim
;; not needed with evil
;(require 'iy-go-to-char)
;(global-set-key (kbd "C-c f") 'iy-go-to-char)
;(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
;(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
;(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

;; not sure i need these with emacs 24.2
;; DO need these; move w3m dependencies from site-lisp to my-stuff
;; (require 'w3m-load)
;;  (setq w3m-use-cookies 1)
;;  (setq browse-url-browser-function 'w3m-browse-url)
;;  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;  ;;optional keyboard short-cut
;;  (global-set-key "\C-xm" 'browse-url-at-point)

(put 'narrow-to-region 'disabled nil)
