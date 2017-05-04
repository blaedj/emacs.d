;;; evil-config -- custom configuration related to evil-mode
;;; Commentary:
;;;
;;; Code:

(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    ;; ....
    ))

(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode))

(provide 'evil-config)
 ;;; evil-config.el ends here
