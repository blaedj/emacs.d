;;; init.el --- my init file.
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ...
(setq inhibit-startup-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(background-color "#002b36")
 '(background-mode dark)
 '(coffee-tab-width 2)
 '(cursor-color "#657b83")
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "f11b028f78c8934c4dea255d94c491f7ced8720db594f9454dbec55938af3934" "1c57936ffb459ad3de4f2abbc39ef29bfb109eade28405fa72734df1bc252c13" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(fci-rule-color "#37474f")
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval setq org-agenda-files
	   (list
	    (concat org-directory "/todo.org"))))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

;; Display the total loading time in the minibuffer

(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Initialized in %s" (emacs-init-time)))


(defvar bcj-emacs-init-file (or load-file-name buffer-file-name))

(defvar bcj-emacs-config-dir (file-name-directory bcj-emacs-init-file))
(defvar bcj-init-dir  (expand-file-name "init.d" bcj-emacs-config-dir ))

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
(load "~/.emacs.d/custom-lisp/seeing-is-believing.el")
(require 'seeing-is-believing)

(require 'mydefuns) ;; some custom functions

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))) t)
 '(magit-diff-added ((t (:inherit diff-added)))))
(provide 'init)
;;; init.el ends here
