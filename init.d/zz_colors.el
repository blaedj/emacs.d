
;;; Commentary:
;; Some color customizations
;;; Code:
(if (display-graphic-p)
    (load-theme 'solarized-dark-custom t)
  (progn
    (load-theme 'subatomic256))
  )

;;modeline customization;;;;;;;;;;;;;;;;
(sml/setup)
;;(sml/apply-theme 'dark)
;;(sml/apply-theme 'light)
;;(sml/apply-theme 'respectful)
;;(sml/apply-theme 'automatic)
;;(sml/customize)
(setq sml/modified-char "*")
(setq sml/show-client t)
(setq display-time-default-load-average nil)
(display-time)


;; hide 'auto-complete', 'yasnippet' and 'smart-parens' minor modes
;; indicators from mode line
(setq rm-excluded-modes '(" hl-p" " AC" " yas" " SP"))

;;(display-battery-mode 1)

;; Fill column
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "sienna")
(setq-default fill-column 80)

(setq org-todo-keyword-faces
      '(
	("IN-PROGRESS" .
	 (:background "lime green"  :foreground "#002b36" :weight bold))
	("ON-HOLD" .
	 (:background "#427"  :foreground "#ddd" :weight normal))
	))

(provide 'zz_colors)
;;; zz_colors.el ends here
