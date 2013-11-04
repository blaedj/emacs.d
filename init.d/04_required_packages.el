
(require 'dired-details)
(require 'dired-details+)
(setq dired-details-hidden-string "--  " )

;; temporarily deprecated to try out smartparens
;(require 'autopair)
;(autopair-mode)

(require 'smartparens)

(global-subword-mode t)

(require 'smex)

(require 'ido)
(require 'flx-ido)
(ido-mode 1) ;Enable "interactive-do"-mode
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;;---yasnippet---
(require 'yasnippet)
(yas/global-mode 1)
(yas-load-directory "~/.emacs.d/snippets/")

(require 'ace-jump-mode)

(require 'buffer-move)
;;(setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
;;(add-to-list 'ac-sources 'ac-source-yasnippet)  ;put snippets in ac dropdown

;;---Wrap-region---
(require 'wrap-region)
(wrap-region-global-mode t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)

(require 'auto-complete-config)           ;load the default configuration
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")
(global-auto-complete-mode t)
(setq ac-auto-start 1)  ;set ac to start after 1 character is typed
(setq ac-auto-show-menu 0.1)
(setq ac-use-fuzzy t)   ;use fuzzy matching
