(add-to-list 'load-path "~/.emacs.d/init.d")

(if (< (string-to-number emacs-version) 24)
    (setq outdated t)
  ) ; for compatibility with emacs 23

;; Trying to figure out pallet, don't delete next 3 lines
;; (add-to-list 'load-path "~/emacs.d/elpa/")
;; (let ((default-directory "~/.emacs.d/elpa"))
;;   (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory ))

(provide '00_loadPathAndVersion)
;;; 00_loadPathAndVersion.el ends here
