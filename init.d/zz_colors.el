(if (boundp 'outdated)
    (require 'color-theme)
  ;; FIXME if outdated, set the color theme as well as requiring color-theme
  ;;	(color-theme-oswald)
  )
(unless (boundp 'outdated)
  (load-theme 'solarized-dark-custom t)
  )

					;(setq-default mode-line-format '("%e"))


;;modeline customization

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
