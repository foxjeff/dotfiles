(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-text-browser "/usr/local/bin/w3m")
 '(completion-auto-help (quote lazy))
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(history-length t)
 '(icomplete-mode t)
 '(savehist-mode t nil (savehist))
 '(scroll-bar-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(w3m-command "/usr/local/bin/w3m")
 '(w3m-home-page "duckduckgo.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-font "Inconsolata-15")

(add-to-list 'load-path "/Users/anand/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
;(add-to-list 'load-path "/Users/anand/.emacs.d/icicles/")

(setq ring-bell-function 'ignore)
(setq kill-read-only-ok 1)
(menu-bar-mode 0)

(require 'org-install)
 (setq org-log-done 'time)
 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cb" 'org-iswitchb)

(require 'color-theme)
 (eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))  ;;dark, like light table
;(color-theme-midnight)
;(color-theme-feng-shui)
;(color-theme-classic)
;(color-theme-high-contrast)
;(color-theme-vimcolors)

 (setq default-frame-alist
          '((top . 1) (left . 1) (width . 120) (height . 62)))
 (setq initial-frame-alist
          '((top . 1) (left . 1) (width . 120) (height . 62)))

(require 'w3m-load)
 (setq w3m-use-cookies 1)
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;;optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)

(setq tramp-mode nil)

;(global-set-key "\C-w" 'backward-kill-word) ;not sure about these 2
;(global-set-key "\C-x\C-k" 'kill-region)
;(global-set-key "\C-xt" 'beginning-of-buffer)
;(global-set-key "\C-xe" 'end-of-buffer)

;; some vim-style movement for read-only buffers
(defun my-scroll-down () (interactive) (scroll-down 1))
(defun my-scroll-up () (interactive) (scroll-up 1))
 
(add-hook 'Info-mode-hook '(lambda () (interactive) (local-set-key "J" 'my-scroll-up)))
(add-hook 'Info-mode-hook '(lambda () (interactive) (local-set-key "K" 'my-scroll-down)))
(add-hook 'Info-mode-hook '(lambda () (interactive) (local-set-key "j" 'next-line)))
(add-hook 'Info-mode-hook '(lambda () (interactive) (local-set-key "k" 'previous-line)))
(add-hook 'help-mode-hook '(lambda () (interactive) (local-set-key "J" 'my-scroll-up)))
(add-hook 'help-mode-hook '(lambda () (interactive) (local-set-key "K" 'my-scroll-down)))
(add-hook 'apropos-mode-hook '(lambda () (interactive) (local-set-key "J" 'my-scroll-up)))
(add-hook 'apropos-mode-hook '(lambda () (interactive) (local-set-key "K" 'my-scroll-down)))

(global-set-key (kbd "<f1>") '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "<f2>") '(lambda () (interactive) (other-window 1)))

(ido-mode 1)
 (setq ido-enable-flex-matching t)
 (setq ido-everywhere t)

;(global-linum-mode 1)

;(require 'icicles)
;(eval-after-load "ring" '(progn (require 'ring+)))
;(icy-mode)

;(setq redisplay-dont-pause t                                                       
;       scroll-margin 1                                                                  
;       scroll-step 1                                                                    
;       scroll-conservatively 10000                                                      
;       scroll-preserve-screen-position 1)
