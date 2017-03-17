(require 'smartparens)
(require 'smartparens-config)

(smartparens-global-mode t)

(global-subword-mode t)

(require 'smex)

(require 'ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'yasnippet)
(yas/global-mode 1)
(setq yas-installed-snippets-dir "~/.emacs.d/snippets/")


(require 'popup)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq  yas/prompt-functions
    '(yas/popup-isearch-prompt yas/ido-prompt yas/completing-prompt yas/dropdown-prompt yas-x-prompt yas-no-prompt))

(require 'ace-jump-mode)

(require 'zeal-at-point)
(global-set-key (kbd "C-c C-d") 'devdocs-search)
(require 'dash-at-point )
(global-set-key "\C-cd" 'dash-at-point)

;;(require 'powerline)
;;(powerline-default-theme)

(require 'buffer-move)
(require 'smartscan)
(require 'ag)

(require 'web-mode)
(require 'yaml-mode)

(require 'rainbow-mode)

(require 'rvm)
(rvm-use-default)


(require 'elixir-mode)

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
