(if (boundp 'outdated)
    (require 'color-theme)
  ;; FIXME if outdated, set the color theme as well as requiring color-theme
  ;;	(color-theme-oswald)
  )
(unless (boundp 'outdated)
  (load-theme 'solarized-dark-custom t)
  )
(require 'highlight-tail)
