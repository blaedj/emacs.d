;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ...
(setq inhibit-startup-message t)
(setq initial-frame-alist '((width . 150) (height . 100)))

(setq bcj-emacs-init-file (or load-file-name buffer-file-name))

(setq bcj-emacs-config-dir
      (file-name-directory bcj-emacs-init-file))

(setq bcj-init-dir
      (expand-file-name "init.d" bcj-emacs-config-dir ))

;; Load all elisp files in ./init.d
(if (file-exists-p bcj-init-dir)
    (dolist (file (directory-files bcj-init-dir t "\\.el$"))
      (load file)))

(load "~/.emacs.d/floobits/floobits.el")

(require 'mydefuns) ;; some custom functions
;;----------stuff below should be removed---------------------


;;TODO
;; organization...
;; tabs.el: make it work especially show-autocomplete &filepath completions
;; look for better/faster way to open files, a la sublime text
;; fix yas dropdown menu type
;;------------------------------------------------------------------0


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "ddccd8fc03f09fb432acd73ba957df0baf764d8f3cb9045c2a77fc0fee8f54b9" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(fci-rule-color "#383838")
 '(foreground-color "#839496")
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt yas-dropdown-prompt yas-x-prompt yas-no-prompt))))
