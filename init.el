;;; init.el --- my init file.
;;; Commentary:
;;; Code:

;;(package-initialize)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ...
(setq inhibit-startup-message t)


(defvar bcj-emacs-init-file (or load-file-name buffer-file-name))

(defvar bcj-emacs-config-dir (file-name-directory bcj-emacs-init-file))
(defvar bcj-init-dir  (expand-file-name "init.d" bcj-emacs-config-dir ))

(setq custom-file (expand-file-name "custom.el" bcj-init-dir))

;; Display the total loading time in the minibuffer

(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Initialized in %s" (emacs-init-time)))



;; set secrets
(if (file-exists-p (concat bcj-emacs-config-dir ".private.el" ))
    (load-file (concat bcj-emacs-config-dir ".private.el" ))
  (error ".private.el does not exist, please copy .example.private.el to .private.el and fill it out")
  )


;; credit for the benchmark code from qsdfgh.com/articles/2016/11/02/emacs-loading-time.html
;; Benchmark loading time file by file and display it in the *Messages* buffer
(when init-file-debug
  (require 'benchmark))

(let ((lisp-dir bcj-init-dir))
  (add-to-list 'load-path lisp-dir)
  (mapc (lambda (fname)
          (let ((feat (intern (file-name-base fname))))
            (if init-file-debug
                (message "Feature '%s' loaded in %.2fs" feat
                         (benchmark-elapse (require feat fname)))
              (require feat fname))))
        (directory-files lisp-dir t "\\.el")))
;; -- end benchmark code


;; Load all elisp files in ./init.d
(if (file-exists-p bcj-init-dir)
    (dolist (file (directory-files bcj-init-dir t "\\.el$"))
      (load file)))

;;(require 'mydefuns) ;; some custom functions

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))))
 '(hl-line ((t (:inverse-video t :underline nil))))
 '(magit-diff-added ((t (:inherit diff-added)))))
(provide 'init)
;;; init.el ends here
