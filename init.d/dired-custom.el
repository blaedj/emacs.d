;;; dired-custom -- customizations for dired-mode
;;; Commentary:
;;;
;;; Code:


(add-hook 'dired-mode-hook (lambda ()
			     (dired-hide-details-mode 1)))

(provide 'dired-custom)
;;; dired-custom.el ends here
