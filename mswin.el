;; occasional pause (or stutter) on win32 emacs 23.0.95
(setq w32-get-true-file-attributes nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

(defun visit-hosts ()
  (interactive)
  (find-file (concat (getenv "WINDIR") "/system32/drivers/etc/hosts")))
