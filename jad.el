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
  (setq c-basic-offset 4))
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
