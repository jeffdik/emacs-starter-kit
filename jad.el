;; set in Emacs Starter Kit
;; (tool-bar-mode)
;; (menu-bar-mode 0)
;; (transient-mark-mode t)
(server-start)

(load "jad-org.el")

;;; csharp mode
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.asmx$" . csharp-mode))
(defun my-csharp-mode-hook ()
  (setq c-basic-offset 4)
  ;; (c-set-offset 'arglist-intro '++)
  ;; (c-set-offset 'arglist-cont-nonempty '++)
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

(require 'slime)
