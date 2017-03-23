;;; ido-config -- my preferences for ido
;;; Commentary:
;;;
;;; Code:

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(ido-vertical-mode 1) ; display choices vertically, not horizontally
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


(provide 'ido-config)
;;; ido-config.el ends here
