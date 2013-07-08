(require 'dired-details)
(require 'dired-details+)
(setq dired-details-hidden-string "" )


(require 'autopair)
(autopair-mode)
(global-subword-mode t)
(require 'smex)


;(require 'sr-speedbar)

;;---------auto-complete mode----------------------------
(require 'auto-complete-config)           ;load the default configuration
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")  ;make sure we can find the dictionaries
(global-auto-complete-mode t)
(setq ac-auto-start 1)                    ;set ac to start after 1 character is typed


;;---yasnippet---
(require 'yasnippet)
(yas/global-mode 1)
(yas-load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/") ;Load the snippet files
					;(setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(yas-load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/text-mode/")
(add-to-list 'ac-sources 'ac-source-yasnippet)  ;put snippets in ac dropdown

;;---Wrap-region---
(require 'wrap-region)
(wrap-region-global-mode t)
(add-hook 'html-mode-hook 'wrap-region-mode)

(require 'ido)
(ido-mode t)                       ;Enable "interactive-do"-mode
(show-paren-mode t)                ;show matching paren mode
