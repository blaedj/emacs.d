
(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;transient mark mode, can never remember what this is, but its probably important
(setq user-mail-address "blaedj@gmail.com")
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq scroll-step 1)
(display-time-mode)
(setq visible-bell t) ; be quiet!
(setq ring-bell-function 'ignore) ; work-around to annoying bug in emacs and OSX El Capitan. wating for http://debbugs.gnu.org/cgi/bugreport.cgi?bug=21662 to land in a stable version of emacs.

;(set-frame-font "Monaco 11") ; great font, may need to install on non-macs
;;(set-frame-font "Hack 11") ; will need to install. Look at http://sourcefoundry.org/hack/ for the latest downloads.
;(set-frame-font "SourceCodePro")
(set-frame-font "-*-Source Code Pro-light-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 110
		    :weight 'light
		    :width 'normal
		    ;; :height 'normal
		    )

;(set-frame-font "Anonymous Pro 12")

;; don't disable these commands
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(require 'multi-term)
(setq multi-term-program-switches "--login")

;; use the correct ruby version


(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; some face customizations for showing matching parens
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)


;;(require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (save-buffers-kill-emacs)
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))


;; use emacs as a server so that we can use our 'ec' command from cli.
;(unless (server-running-p)
 ; (start-server))
