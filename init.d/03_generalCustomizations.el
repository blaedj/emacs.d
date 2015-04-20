
(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;transient mark mode, can never remember what this is, but its probably important
(setq user-mail-address "blaedj@gmail.com")
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq scroll-step 1)
(display-time-mode)
(setq visible-bell t) ; be quiet!

(set-frame-font "Monaco 11") ; great font, may need to install on non-macs
;(set-frame-font "Anonymous Pro 12")

;; don't disable these commands
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil) ; Don't prompt me before using 'upcase-region'

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; don't activate yasnippet for ansi-term,
;; it breaks shell tab-completion

(require 'multi-term)
(setq multi-term-program-switches "--login")

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; some face customizations for showing matching parens
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)


(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; use emacs as a server so that we can use our 'ec' command from cli.
;(unless (server-running-p)
 ; (start-server))
