
(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;transient mark mode, can never remember what this is, but its probably important
(setq user-mail-address "blaedj@gmail.com")
(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))  ;remove unneccesary whitespace before saving a file
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq scroll-step 1)

;(set-frame-font "Monaco 11") ; great font, may need to install on non-macs
(set-frame-font "Anonymous Pro 12")

(put 'upcase-region 'disabled nil)

;; don't activate yasnippet for ansi-term,
;; it breaks shell tab-completion
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))
(require 'multi-term)
(setq multi-term-program-switches "--login")

(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)
