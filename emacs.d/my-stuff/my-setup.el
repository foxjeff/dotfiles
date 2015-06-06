;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

;; pending changes to init.el

;; ido-recentf-open
(require 'recentf)

;; Implement functionality similar to uniquify to make recentf results bearable
;; Requires s.el and dash.el - awesome libraries from Magnar Sveen
;; Hat-tip : Baishampayan Ghose for the clojure implementation at
;; http://www.masteringemacs.org/articles/2011/01/27/find-files-faster-recent-files-package/
;; https://gist.github.com/ghoseb/8432086
(require 's)
(require 'dash)
;; seems to work brilliantly

(defun explode (d)
  "Explode a directory name to its subcomponents."
  (s-split "/" d))


(defun tails* (coll acc)
  "Return successive tails of a collection."
  (if (cdr coll)
      (tails* (cdr coll) (cons coll acc))
    (cons coll acc)))


(defun tails (coll)
  "Return successive tails of a collection."
  (tails* coll '()))


(defun paths (d)
  "Given a single directory, return all the possible sub-paths / name
  representations for it."
  (mapcar (lambda (xs) (s-join "/" xs)) (tails (explode d))))


(defun index-coll (tab coll)
  "Given a table and a collection, add each entry of the
  collection into the table. If the key already exists, inc it's
  value by 1"
  (mapcar (lambda (x) (puthash x (+ 1 (gethash x tab 0)) tab)) coll)
  tab)


(defun vm-uniquify (filenames)
  "Given a bunch of filenames (as returned by `recentf-list'),
  simplify the names to make them more easily readable."
  (let* ((expanded-paths (mapcar 'paths filenames))
         (tab (make-hash-table :test 'equal))
         (freqs (mapcar (apply-partially 'index-coll tab) expanded-paths)))
    (mapcar (apply-partially '-first (lambda (x) (= 1 (gethash x tab 0))))
            expanded-paths)))


;; Mastering Emacs + some of my own elisp
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (let* ((unique-filenames (vm-uniquify recentf-list))
         (filename-map (-partition 2 (-interleave unique-filenames
                                                  recentf-list)))
         (short-filename (ido-completing-read "Choose recent file: "
                                              unique-filenames
                                              nil
                                              t)))
    (if short-filename
        (find-file (cadr (assoc short-filename filename-map)))
      (message "Aborting"))))

;; (defun ido-recentf-open ()
;;   "Use `ido-completing-read' to \\[ido-find-file] a recent file"
;;   (interactive)
;;   (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;       (message "Opening file...")
;;     (messge "Aboring")))

;; and my old nemesis
(global-set-key (kbd "C-x f") 'ido-recentf-open)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(defalias 'list-buffers 'ibuffer)
;; or:
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; I'm liking this
(delete-selection-mode t)
;; and this
(electric-pair-mode t)

;; mousey stuff
(setq mouse-wheel-scroll-amount '(1
  ((shift)
   . 5)
  ((control)))
)
(setq mouse-wheel-progressive-speed nil)
(mouse-wheel-mode t)

;; js2-mode
(setq js2-bounce-indent-p t)

;; web-mode
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-current-element-highlight t)

;; for use with C-x C-- and C-x C-+
(setq text-scale-mode-step 1.1)

;; open new line stuff
;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
  See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1))
(defun open-previous-line (arg)
  "Move to the next line and then opens a line."
  (interactive "p")
  (beginning-of-line)
  (open-line arg))

(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "M-o") 'open-previous-line)

(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(global-set-key (kbd "C-<left>") 'ns-next-frame)
(global-set-key [C-right] 'ns-next-frame)

;; for elisp anyway
(auto-complete-mode)
(ac-start)

;; M-` for jumping to marks
;; already in init.el

;; trying this, M-; was already comment-dwim
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "M-.") 'other-window)

;; for Marked
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "open -a /Applications/Marked.app %s" 
       (shell-quote-argument (buffer-file-name))))
)
(global-set-key "\C-cm" 'markdown-preview-file)
;; misc stuff
(setq markdown-command "/usr/local/bin/multimarkdown")


;; for Cider repl history
(setq cider-repl-history-size 2000)
(setq cider-repl-history-file "~/.emacs.d/nrepl-history")

(require 'expectations-mode)

(add-to-list 'sml/replacer-regexp-list '("^~/Projects/" ":Proj:"))

(require 'expand-region)
;;(global-set-key (kbd "S-SPC") 'er/expand-region)
;;(global-set-key (kbd "C-S-SPC") 'er/contract-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; to bring in shell env variables like path and manpath
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "NODE_PATH")

(provide 'my-setup)
