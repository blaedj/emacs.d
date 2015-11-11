
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups1")))))
(setq vc-make-backup-files t)

 ;; (setq auto-save-file-name-transforms
 ;;        '())
