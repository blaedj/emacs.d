(require 'smartparens)
(require 'smartparens-config)

(require 'smex)
(require 'idle-highlight)
(require 'ido)
(require 'flx-ido)

(require 'yasnippet)

(require 'ace-jump-mode)

(require 'zeal-at-point)

(require 'dash-at-point )

(require 'buffer-move)
(require 'smartscan)
(require 'ag)

(require 'web-mode)
(require 'yaml-mode)

(require 'rainbow-mode)

(require 'rvm)
(rvm-use-default)


(require 'elixir-mode)

(require 'vue-mode)
;;(require 'eclim)
;;(require 'eclimd)
;;(require 'company)
;;(require 'company-emacs-eclim)
;;(company-emacs-eclim-setup)

(require 'auto-complete-clang)
(require 'cpputils-cmake)

;;Git-gutter is broken for emacs version:
;;GNU Emacs 24.3.93.1 (x86_64-apple-darwin13.3.0, NS apple-appkit-1265.21) of 2014-08-14 on builder10-9.porkrind.org

;; Enhancements to the image-viewing mode
(eval-after-load 'image '(require 'image+))
;; automatically adjust the zoom level
(eval-after-load 'image+ '(imagex-auto-adjust-mode 1))

(load "~/.emacs.d/custom-lisp/seeing-is-believing.el")
(require 'seeing-is-believing)

(provide '04_required_packages)
;;; 04_required_packages.el ends here
