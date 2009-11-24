(setq org-agenda-files '("~/org/Life.org"
			 "~/org/refile.org"))
(setq org-default-notes-file "~/org/refile.org")


;; diary
(setq diary-file "~/org/diary")

(color-theme-zenburn)

(require 'slime)
(slime-setup)

(add-to-list 'slime-lisp-implementations '(clbuild ("/home/jad/repos/external/darcs/clbuild/clbuild" "lisp")))
(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))

(setq slime-backend "/home/jad/repos/external/darcs/clbuild/jad-swank-loader.lisp")