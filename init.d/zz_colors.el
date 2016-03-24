
(if (display-graphic-p)
    (load-theme 'solarized-dark-custom t)
  (progn
    (require 'color-theme-approximate )
    (color-theme-approximate-on)
    (load-theme 'solarized-dark-custom t))
  )


;(require 'smart-mode-line )
(sml/setup)

;(sml/apply-theme 'dark)
;(sml/apply-theme 'light)
;(sml/apply-theme 'respectful)
;(sml/apply-theme 'automatic)
;;(sml/customize)
(setq sml/modified-char "*")
(setq sml/show-client t)

;;(display-battery-mode 1)

;;(setq powerline-arrow-shape 'arrow)
;; (setq powerline-color1 "grey22")
;; (setq powerline-color2 "grey40")
;; (custom-set-faces
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))


;; Fill column
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "sienna")
(setq-default fill-column 80)
