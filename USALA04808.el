(set-default-font "ProggyCleanTTSZ-12")
(color-theme-zenburn)

(setq org-agenda-files '("~/org/Work.org"
			 "~/org/refile.org"))
(setq org-default-notes-file "~/org/refile.org")

(add-to-list 'auto-mode-alist '( "\\.w$" . nuweb-mode))
(autoload 'nuweb-mode "nuweb" "Load nuweb-mode" t)
