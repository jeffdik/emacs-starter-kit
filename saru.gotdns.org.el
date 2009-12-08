(setq org-agenda-files '("~/org/Life.org"
			 "~/org/refile.org"))
(setq org-default-notes-file "~/org/refile.org")


;; diary
(setq diary-file "~/org/diary")

(color-theme-zenburn)

;;; Need to require slime here, otherwise we get the following error
;;; Warning (initialization): An error occurred while loading `/home/jad/.emacs.d/init.elc':
;;;
;;; Symbol's value as variable is void: slime-lisp-implementations
(require 'slime)

(add-to-list 'slime-lisp-implementations '(clbuild ("/home/jad/repos/external/darcs/clbuild/clbuild" "lisp")))
(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))

(setq slime-backend "/home/jad/repos/external/darcs/clbuild/jad-swank-loader.lisp")

(eval-after-load 'erc
  (load "jad-erc-auth.el"))