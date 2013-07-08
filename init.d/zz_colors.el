(if (boundp 'outdated)
    (require 'color-theme)
  ;; FIXME if outdated, set the color theme as well as requiring color-theme
  ;;	(color-theme-oswald)
  )
					;(set-cursor-color "magenta2")
					;(set-mouse-color "green")
					;(load-theme 'solarized-dark t)'
(unless (boundp 'outdated)
  (add-to-list 'custom-theme-load-path "/home/blaed/.emacs.d/elpa/customThemes/")
  (load-theme 'solarized-dark t)
  )
