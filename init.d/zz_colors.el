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
  ;; the bleed through of the solarized-light theme into zenburn is nice.
  ;; should find a way to save current color settings and set as new theme.
  (load-theme 'solarized-light t)
  (load-theme 'misterioso t)
  )
