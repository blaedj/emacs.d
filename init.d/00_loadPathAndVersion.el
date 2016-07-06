(add-to-list 'load-path "~/.emacs.d/init.d")

(if (< (string-to-number emacs-version) 24)
    (setq outdated t)
  ) ; for compatibility with emacs 23
(add-to-list 'load-path "~/emacs.d/custom-lisp/")
;; Trying to figure out pallet, don't delete next 3 lines
;; (add-to-list 'load-path "~/emacs.d/elpa/")
;; (let ((default-directory "~/.emacs.d/elpa"))
;;   (normal-top-level-add-subdirs-to-load-path))
