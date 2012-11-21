;; PATH
(add-to-list 'load-path "~/.emacs.d/myext")

;; REQUIRE-MAYBE
(defmacro require-maybe (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file 'noerror))

; ELPA
(require-maybe 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source t))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; KEY BINDINGS, M-ξ
(global-set-key (kbd "M-a") 'file-cache-add-directory-recursively)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "M-d") 'kill-word)
  (global-set-key (kbd "M-e") 'UNBOUND)
(global-set-key (kbd "M-f") 'forward-word)
  (global-set-key (kbd "M-g") 'UNBOUND)
  (global-set-key (kbd "M-h") 'UNBOUND)
(global-set-key (kbd "M-i") 'back-to-indentation)
(global-set-key (kbd "M-j") 'just-one-space)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "M-m") 'delete-trailing-whitespace)
  ; M-n is not remapped, system new window
(global-set-key (kbd "M-o") 'ido-recentf-open)
(global-set-key (kbd "M-p") 'copy-region-as-kill)
  ; M-q is not remapped, system quit
(global-set-key (kbd "M-r") 'revert-buffer)
  (global-set-key (kbd "M-s") 'UNBOUND)
  ; M-t is not remapped, system new tab
(global-set-key (kbd "M-u") 'undo)
  ; M-v is not remapped, system paste
  ; M-w is not remapped, system close window
  (global-set-key (kbd "M-x") 'UNBOUND)
  (global-set-key (kbd "M-y") 'UNBOUND)
(global-set-key (kbd "M-z") 'zap-to-char)
(global-set-key (kbd "M-;") 'comment-dwim)
(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-\\") 'delete-horizontal-space)


;; KEY BINDINGS, C-ξ
(global-set-key "\C-a" 'move-beginning-of-line)
(global-set-key "\C-b" 'backward-char)
; C-c is an emacs prefix
(global-set-key "\C-d" 'delete-char)
(global-set-key "\C-e" 'move-end-of-line)
(global-set-key "\C-f" 'forward-char)
(global-set-key "\C-g" 'keyboard-quit)
(global-set-key "\C-h" 'help)
; C-i is tab
(global-set-key "\C-j" 'newline-and-indent)
(global-set-key "\C-k" 'kill-line)
(global-set-key "\C-l" 'recenter-to-bottom)
(global-set-key "\C-m" 'newline)
(global-set-key "\C-n" 'next-line)
(global-set-key "\C-o" 'open-line)
(global-set-key "\C-p" 'previous-line)
(global-set-key "\C-q" 'quoted-insert)
(global-set-key "\C-r" 'isearch-backward)
(global-set-key "\C-s" 'isearch-forward)
  (global-set-key "\C-t" 'UNBOUND)
(global-set-key "\C-u" 'universal-argument)
(global-set-key "\C-v" 'scroll-up-command)
(global-set-key "\C-w" 'backward-kill-word)
; C-x is an emacs prefix
(global-set-key "\C-z" 'suspend-frame)
; C-; comments without region


;; KEY BINDINGS, C-ξ C-ξ
(global-set-key "\C-c\C-a" 'apropos)
  (global-set-key "\C-c\C-b" 'UNBOUND)
  (global-set-key "\C-c\C-c" 'UNBOUND)
  (global-set-key "\C-c\C-d" 'UNBOUND)
  (global-set-key "\C-c\C-e" 'UNBOUND)
  (global-set-key "\C-c\C-f" 'UNBOUND)
  (global-set-key "\C-c\C-g" 'UNBOUND)
  (global-set-key "\C-c\C-h" 'UNBOUND)
  (global-set-key "\C-c\C-i" 'UNBOUND)
  (global-set-key "\C-c\C-j" 'UNBOUND)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-c\C-l" 'downcase-word)
(global-set-key "\C-c\C-m" 'execute-extended-command)
  (global-set-key "\C-c\C-n" 'UNBOUND)
  (global-set-key "\C-c\C-o" 'UNBOUND)
  (global-set-key "\C-c\C-p" 'UNBOUND)
  (global-set-key "\C-c\C-q" 'UNBOUND)
(global-set-key "\C-c\C-r" 'string-rectangle)
  (global-set-key "\C-c\C-s" 'UNBOUND)
  (global-set-key "\C-c\C-t" 'UNBOUND)
(global-set-key "\C-c\C-u" 'upcase-word)
(global-set-key "\C-c\C-v" 'scroll-down-command)
(global-set-key "\C-c\C-w" 'whitespace-mode)
  (global-set-key "\C-c\C-x" 'UNBOUND)
  (global-set-key "\C-c\C-y" 'UNBOUND)
  (global-set-key "\C-c\C-z" 'UNBOUND)


;; KEY BINDINGS, C-ξ ξ
(global-set-key (kbd "C-c a") 'ensime-refactor-add-import)
(global-set-key (kbd "C-c b") 'ensime-sbt)
(global-set-key (kbd "C-c c") 'ensime-sbt-do-compile)
(global-set-key (kbd "C-c d") 'ensime-edit-definition) ; jump to definition
(global-set-key (kbd "C-c e") 'ensime)
(global-set-key (kbd "C-c f") 'ensime-format-source) ; scalariform
  (global-set-key (kbd "C-c g") 'UNBOUND)
  (global-set-key (kbd "C-c h") 'UNBOUND)
(global-set-key (kbd "C-c i") 'ensime-inspect-type-at-point)
  (global-set-key (kbd "C-c j") 'UNBOUND)
(global-set-key (kbd "C-c k") 'ensime-typecheck-current-file)
(global-set-key (kbd "C-c K") 'ensime-typecheck-all)
  (global-set-key (kbd "C-c l") 'UNBOUND)
(global-set-key (kbd "C-c m") 'ensime-import-type-at-point)
  (global-set-key (kbd "C-c n") 'UNBOUND)
(global-set-key (kbd "C-c o") 'ensime-refactor-organize-imports)
(global-set-key (kbd "C-c p") 'ensime-show-all-errors-and-warnings)
  (global-set-key (kbd "C-c q") 'UNBOUND)
(global-set-key (kbd "C-c r") 'ensime-refactor-rename)
(global-set-key (kbd "C-c s") 'ensime-search)
  (global-set-key (kbd "C-c t") 'UNBOUND)
(global-set-key (kbd "C-c u") 'ensime-show-uses-of-symbol-at-point)
(global-set-key (kbd "C-c v") 'ensime-scalex-choose-current-result)
(global-set-key (kbd "C-c w") 'ensime-pop-find-definition-stack) ; backwards
(global-set-key (kbd "C-c x") 'ensime-scalex)
(global-set-key (kbd "C-c y") 'ensime-show-doc-for-symbol-at-point) ; scaladocs
(global-set-key (kbd "C-c z") 'ensime-inf-switch) ; scala interpreter

;; GENERAL
(setq-default column-number-mode t)
(setq inhibit-splash-screen t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)
(setq scroll-margin 2)
(setq scroll-step 1 scroll-conservatively 10000)
(require-maybe 'saveplace)
(setq-default save-place t)
(setq require-maybe-final-newline t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width '2)
(setq auto-save-default nil)

;; FREAK OUT DUE TO CARRIAGE RETURNS
(custom-set-faces
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))

(add-hook
 'font-lock-mode-hook
 (function
  (lambda ()
    (setq
     font-lock-keywords
     (append
      font-lock-keywords
      '(
        ("\r" (0 'my-carriage-return-face t))
        ("\t" (0 'my-tab-face t))
        ))))))

;; NOTIFY LONG LINES, NEW WAY
(setq whitespace-style
  (quote (face trailing tab-mark lines-tail)))
; (add-hook 'find-file-hook 'whitespace-mode)
(setq
 whitespace-display-mappings ;http://ergoemacs.org/emacs/whitespace-mode.html
 '(
   (tab-mark 9 [9654 9] [92 9])
   ;others substitutions...
   ))

;; SCALA
(add-to-list 'load-path "~/.emacs.d/external/scala-mode")
(add-to-list 'load-path "~/.emacs.d/external/scalatra-mode")
(require-maybe 'scala-mode)
(add-hook 'scala-mode-hook
          (lambda () (whitespace-mode 1)))
(add-hook 'scala-mode-hook
          (lambda () (subword-mode 1)))


(setq scala-indent:indent-value-expression nil)
(setq scala-indent:align-parameters nil)
(setq scala-indent:align-forms nil)
(setq auto-mode-alist
      (cons '("\\.sbt$" . scala-mode)
            auto-mode-alist))

;; MARKDOWN-MODE
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode)
            auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode)
            auto-mode-alist))

;; ENSIME
(add-to-list 'load-path "~/.emacs.d/ensime/elisp")
(require-maybe 'ensime)

; semantic highlighting colors
(setq ensime-sem-high-faces
      '(
        (var . (:slant italic :foreground "#fa8072"))
        (val . (:foreground "#cdbe70"))
        (varField . (:foreground "#fa8072" :bold t :slant italic))
        (valField . (:foreground "#cdbe70" :slant italic))
        (functionCall . (:foreground "#7ec0ee" :slant italic))
        (param . (:foreground "#ee7942"))
        (class . (:foreground "#76eec6"))
        (trait . (:foreground "#7CCD7C"))
        (object . (:italic t :foreground "#76eec6"))
        (package . font-lock-preprocessor-face)
        ))

;; IDO
;; (require-maybe 'ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (setq ido-file-extensions-order
;;       '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
;; (setq confirm-nonexistent-file-or-buffer nil)
;; (setq ido-enable-flex-matching t)
;; (setq ido-create-new-buffer 'always)
;; (setq ido-enable-tramp-completion nil)
;; (setq ido-enable-last-directory-history nil)
;; (setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
;; (setq ido-show-dot-for-dired t) ;; put . as the first item
;; (setq ido-use-filename-at-point t) ;; prefer file names near point

;; RECENTF
;; (require-maybe 'recentf)
;;  (recentf-mode t)
;; (setq recentf-max-saved-items 50)
;; (defun ido-recentf-open ()
;;   "Use `ido-completing-read' to \\[find-file] a recent file"
;;   (interactive)
;;   (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;       (message "Opening file...")
;;     (message "Aborting")))

;; HELM
;; (require-maybe 'helm-config)
;; (helm-mode 1)
;; (require-maybe 'helm-gist)
;; (require-maybe 'helm-git)
;; (require-maybe 'helm-projectile)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x f") 'helm-for-files)

;; LINES
;; (global-linum-mode 1)
;; (setq linum-format "%d ")
;; (setq linum-format "%4d \u2502 ")
;; (require-maybe 'highline)
;; (highline-mode 1)

;; PROJECTILE
;; (require-maybe 'projectile)
;; (projectile-global-mode)

;; UTILITY FUNCTIONS
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond
   ((not (= (count-windows) 2))
    (message "You need exactly 2 windows to do this."))
   (t
    (let* ((w1 (first (window-list)))
           (w2 (second (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (newname (concat dir "/" name)))

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn
        (copy-file filename newname 1)
        (delete-file filename)
        (set-visited-file-name newname)
        (set-buffer-modified-p nil)
        t))))

(defun UNBOUND ()
  "UNBOUND"
  (interactive)
  (message "UNBOUND KEY"))
