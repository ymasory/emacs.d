(add-to-list 'load-path "~/.emacs.d/myext")

; ELPA
(require 'package)
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source t))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; KEY BINDINGS
(global-set-key (kbd "M-a") 'file-cache-add-directory-recursively)
(global-set-key (kbd "M-e") 'ensime)
(global-set-key (kbd "M-h") 'help)
(global-set-key (kbd "M-p") 'copy-region-as-kill)
(global-set-key (kbd "M-j") 'just-one-space)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "M-l") 'whitespace-mode)
(global-set-key (kbd "M-i") 'back-to-indentation)
(global-set-key (kbd "M-m") 'delete-trailing-whitespace)
(global-set-key (kbd "M-o") 'ido-recentf-open)
(global-set-key (kbd "M-r") 'revert-buffer)
(global-set-key (kbd "M-u") 'undo)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-l" 'downcase-word)
(global-set-key "\C-c\C-u" 'upcase-word)
(global-set-key "\C-c\C-r" 'string-rectangle)
(global-set-key "\C-c\C-v" 'scroll-down-command)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-m" 'execute-extended-command)

;; ENSIME
(add-to-list 'load-path "~/.emacs.d/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook
          'ensime-scala-mode-hook)

; -- start ensime
(global-set-key (kbd "M-e") 'ensime)
; -- completions
; tab --> start completing method/variable
; -- refactor
(global-set-key (kbd "C-c a") 'ensime-refactor-add-import)
(global-set-key (kbd "C-c o") 'ensime-refactor-organize-imports)
(global-set-key (kbd "C-c m") 'ensime-import-type-at-point)
(global-set-key (kbd "C-c r") 'ensime-refactor-rename)
; -- inspections
;; (global-set-key (kbd "C-c y") 'ensime-show-doc-for-symbol-at-point) ; scaladocs
; see type,  'q' quit, 'return' enter hyperlink, '.' forward,  ',' back
(global-set-key (kbd "C-c i") 'ensime-inspect-type-at-point)
; -- format
(global-set-key (kbd "C-c f") 'ensime-format-source) ; scalariform
; -- navigation
(global-set-key (kbd "C-c d") 'ensime-edit-definition) ; jump to definition
(global-set-key (kbd "C-c s") 'ensime-search)
(global-set-key (kbd "C-c u") 'ensime-show-uses-of-symbol-at-point)
(global-set-key (kbd "C-c w") 'ensime-pop-find-definition-stack) ; backwards
; -- compilation
(global-set-key (kbd "C-c b") 'ensime-sbt)
(global-set-key (kbd "C-c c") 'ensime-sbt-do-compile)
(global-set-key (kbd "C-c k") 'ensime-typecheck-current-file)
(global-set-key (kbd "C-c K") 'ensime-typecheck-all)
(global-set-key (kbd "C-c p") 'ensime-show-all-errors-and-warnings)
(global-set-key (kbd "C-c z") 'ensime-inf-switch) ; scala interpreter
; M-n/p go through errors
; -- scalex
(global-set-key (kbd "C-c v") 'ensime-scalex-choose-current-result)
(global-set-key (kbd "C-c x") 'ensime-scalex)
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

;; GENERAL
(setq-default column-number-mode t) ; show column numbers
(setq inhibit-splash-screen t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)
(setq scroll-margin 2) ; start scrolling when 2 lines from top/bottom
(setq scroll-step            1
      scroll-conservatively  10000) ; smooth scrolling
(require 'saveplace) ; save cursor location
(setq-default save-place t)
(setq require-final-newline t) ; require files end with a newline
(setq-default indent-tabs-mode nil) ; a tab is four spaces
(setq-default tab-width '4)
(custom-set-variables
 '(auto-save-default nil))

;; FONT COLORIZATION
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq font-lock-auto-fontify t)
(setq font-lock-use-fonts nil)
(setq font-lock-use-colors t)
(add-hook 'compilation-mode-hook 'font-lock-mode)

;; FREAK OUT DUE TO CARRIAGE RETURNS
(custom-set-faces
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t)
 )
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

;; IDO
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
;; (setq ido-file-extensions-order
;;       '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
(setq ido-show-dot-for-dired t) ;; put . as the first item
(setq ido-use-filename-at-point t) ;; prefer file names near point

;; RECENTF
(require 'recentf)
 (recentf-mode t)
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; HELM
(require 'helm-config)
(helm-mode 1)
(require 'helm-gist)
(require 'helm-git)
(require 'helm-projectile)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-for-files)

;; LINES
(global-linum-mode 1)
(setq linum-format "%d ")
(setq linum-format "%4d \u2502 ")
(require 'highline)
(highline-mode 1)

;; PROJECTILE
(require 'projectile)
(projectile-global-mode)

(require 'color-theme)
(set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)

;; someday might want to rotate windows if more than 2 of them                          
(defun swap-windows ()
 "If you have 2 windows, it swaps them." (interactive) (cond ((not (= (count-windows) 2)
) (message "You need exactly 2 windows to do this."))
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

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
  (filename (buffer-file-name)))
 (if (not filename)
  (message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
   (message "A buffer named '%s' already exists!" new-name)
  (progn   (rename-file name new-name 1)   (rename-buffer new-name)    (set-visited-file-name new-name)    (set-buffer-modified-p nil))))))

;;
;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
   (filename (buffer-file-name))
   (dir
   (if (string-match dir "\\(?:/\\|\\\\)$")
   (substring dir 0 -1) dir))
   (newname (concat dir "/" name)))

 (if (not filename)
  (message "Buffer '%s' is not visiting a file!" name)
 (progn   (copy-file filename newname 1)  (delete-file filename)  (set-visited-file-name newname)   (set-buffer-modified-p nil)   t)))) 

;; SCALA
(add-to-list 'load-path "~/.emacs.d/external/scala-mode")
(add-to-list 'load-path "~/.emacs.d/external/scalatra-mode")
(require 'scala-mode)
(add-hook 'scala-mode-hook
          (local-set-key (kbd "RET") 'newline-and-indent)
          (lambda () (whitespace-mode 1))
          (lambda () (subword-mode 1)))


(setq scala-indent:indent-value-expression nil)
(setq scala-indent:align-parameters nil)
(setq scala-indent:align-forms nil)
(setq auto-mode-alist
      (cons '("\\.sbt$" . scala-mode)
            auto-mode-alist))

;; MARKDOWN-MODE
(autoload
  'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
