;;; smartparens-config -- some custom configuration for smartparens
;;; Commentary:
;;;
;;; Code:

;; don't auto-pair angle brackets in web mode, when used alongside auto-paired
;; erb tags you end up with a lot of '>>''s in your html.
(sp-local-pair 'web-mode "<" nil :actions :rem)

(provide 'smartparens-config)
;;; smartparens-config.el ends here
