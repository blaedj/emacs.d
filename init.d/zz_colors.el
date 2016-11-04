
(if (display-graphic-p)
    (load-theme 'solarized-dark-custom t)
  (progn
    (load-them 'subatomic256)
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


;; hide 'auto-complete', 'yasnippet', 'smart-parens' and 'smartwin' minor mode
;; indicators from mode line
(setq rm-excluded-modes '(" hl-p" " AC" " yas" " SP" " sw"))


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

;; custom config for git-gutter/git-gutter-fr
;;git-gutter-fringe customizations

;; (setq git-gutter-fr:side 'left-fringe)
;; (set-face-foreground 'git-gutter-fr:added "chartreuse1")
;; (set-face-foreground 'git-gutter-fr:deleted "red")
;; (set-face-foreground 'git-gutter-fr:modified "yellow")
;; (setq git-gutter:modified-sign "~")
;; (setq-default left-fringe-width 12)

(provide 'zz_colors)
;;; zz_colors.el ends here
