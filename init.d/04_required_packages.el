
(require 'dired-details)
(require 'dired-details+)
(setq dired-details-hidden-string "--  " )

(require 'smartparens)
(require 'smartparens-ruby)
(smartparens-global-mode t)
(sp-pair "/*" "*/")

(global-subword-mode t)

(require 'smex)

(require 'ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(require 'yasnippet)
(yas/global-mode 1)
(yas-load-directory "~/.emacs.d/snippets/")

(require 'ace-jump-mode)

(require 'buffer-move)

(require 'web-mode)


(require 'auto-complete-config)           ;load the default configuration
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")
(global-auto-complete-mode t)
(setq ac-auto-start 1)  ;set ac to start after 1 character is typed
(setq ac-auto-show-menu 0.1)
(setq ac-use-fuzzy t)   ;use fuzzy matching
;;(add-to-list 'ac-sources 'ac-source-yasnippet)  ;put snippets in ac dropdown

(require 'ag)

(require 'sublimity)
;(require 'sublimity-scroll)
(require 'sublimity-map)
