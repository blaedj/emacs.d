
(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;can never remember what this is, but its vitally important
(setq user-mail-address "blaedj@gmail.com")
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq scroll-step 1)
(display-time-mode)
(setq visible-bell t) ; be quiet!
(setq ring-bell-function 'ignore) ; work-around to annoying bug in emacs and OSX El Capitan. wating for http://debbugs.gnu.org/cgi/bugreport.cgi?bug=21662 to land in a stable version of emacs.

;; don't disable these commands
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(setq linum-format 'dynamic)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; some face customizations for showing matching parens
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)


;;(require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed."
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (save-buffers-kill-emacs)
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))


;; use emacs as a server so that we can use our 'ec' command from cli.
;(unless (server-running-p)
 ; (start-server))

;;spaces manages window configurations
(require 'spaces)

(setq echo-keystrokes 0.1)


(setq save-place-file "~/.emacs.d/saved-point-places"
      save-place-forget-unreadable-files nil)
(save-place-mode t)

(provide '03_generalCustomizations)
;;; 03_generalCustomizations.el ends here
