;;; flycheck-cask-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (flycheck-cask-setup) "flycheck-cask" "flycheck-cask.el"
;;;;;;  (21231 58318 770336 282000))
;;; Generated autoloads from flycheck-cask.el

(autoload 'flycheck-cask-setup "flycheck-cask" "\
Setup Cask integration for Flycheck.

If the current file is part of a Cask project, as denoted by the
existence of a Cask file in the file's directory or any ancestor
thereof, configure Flycheck to initialze Cask packages while
syntax checking.

Set `flycheck-emacs-lisp-initialize-packages' and
`flycheck-emacs-lisp-package-user-dir' accordingly.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("flycheck-cask-pkg.el") (21231 58318 807204
;;;;;;  235000))

;;;***

(provide 'flycheck-cask-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-cask-autoloads.el ends here
