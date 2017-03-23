;;; general-customizations -- mostly globabl customizations
;;; Commentary:
;;; This file should only touch Emacs 'built-ins', as there is no guarantee that
;;; the mode/package you want to customize will be available yet.
;;; Code:

(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;can never remember what this is, but its vitally important
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq scroll-step 1)
(display-time-mode)
(setq visible-bell t) ; be quiet!
(setq ring-bell-function 'ignore)

;; load the file that contains the customizations added by Custom.
(when (file-exists-p custom-file)
  (load custom-file))

(ivy-mode 1)

;; don't disable these commands
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; treat camelCase as two words
(global-subword-mode 1)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(setq linum-format 'dynamic)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; some face customizations for showing matching parens
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)

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

;; show keystrokes for extended commands in the mini-buffer immediately.
(setq echo-keystrokes 0.1)


(setq save-place-file "~/.emacs.d/saved-point-places"
      save-place-forget-unreadable-files nil)
(save-place-mode t)

;;; Enable dot-mode
;(global-dot-mode 1)

;; macro to replace double quotes with single quotes.  assumes that the point is
;; immediately prior to the double-quoted string
(fset 'replace-double-quotes
      [?\M-l ?\' ?\C-d ?\C-s ?\" ?\' ?\C-b backspace ?\C-e])


(provide '03_generalCustomizations)
;;; 03_generalCustomizations.el ends here
