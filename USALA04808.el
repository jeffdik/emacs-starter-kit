(set-default-font "ProggyCleanTTSZ-12")
(color-theme-zenburn)

(load "work-org.el")

(add-to-list 'auto-mode-alist '( "\\.w$" . nuweb-mode))
(autoload 'nuweb-mode "nuweb" "Load nuweb-mode" t)

(load "mswin.el")