;; set in Emacs Starter Kit
;; (tool-bar-mode)
;; (menu-bar-mode 0)
;; (transient-mark-mode t)
(server-start)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(load "jad-org.el")

;;; csharp mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.asmx$" . csharp-mode))
(defun my-csharp-mode-hook ()
  (setq c-basic-offset 4)
  ;; (c-set-offset 'arglist-intro '++)
  ;; (c-set-offset 'arglist-cont-nonempty '++)
  ;;(local-set-key (kbd \"{\") 'c-electric-brace)
  (local-set-key (kbd "{") 'self-insert-command)
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; Don't indent substatements' '{'
;; http://www.chemie.fu-berlin.de/chemnet/use/info/cc-mode/cc-mode_6.html#SEC17
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 8)))

(add-to-list 'load-path (concat dotfiles-dir "/elisp"))
(autoload 'svn-status "psvn" "Load PSVN" t)

(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(remove-hook 'text-mode-hook 'turn-on-flyspell)
(remove-hook 'coding-hook 'local-comment-auto-fill)

(if (not window-system)
    (remove-hook 'coding-hook 'pretty-lambdas))

;;; objective-j mode
;;; from http://github.com/280north/cappuccino/tree/2571b24f222c863afbe5778079da3dd9c10becb1/Tools/Editors/Emacs
(require 'objj-mode)

(load "js2")

;;; from http://www.emacswiki.org/emacs/InteractivelyDoThings#toc8
(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

;;; from http://www.emacswiki.org/emacs/EtagsSelect
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(require 'etags-table)

;;; from https://www.bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs/
(defun mo-toggle-identifier-naming-style ()
  "Toggles the symbol at point between C-style naming,
  e.g. `hello_world_string', and camel case,
  e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

;; sometimes this speeds things up
;; (set-variable vc-handled-backends nil)

;; fsharp

(setq load-path (cons "~/.emacs.d/elisp/fsharp" load-path))
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)
