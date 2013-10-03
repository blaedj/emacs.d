



;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ...
(setq inhibit-startup-message t)

(setq initial-frame-alist '((width . 165) (height . 100)))
(setq bcj-emacs-init-file (or load-file-name buffer-file-name))
(setq bcj-emacs-config-dir
      (file-name-directory bcj-emacs-init-file))
(setq bcj-init-dir
      (expand-file-name "init.d" bcj-emacs-config-dir ))

;; Load all elisp files in ./init.d
(if (file-exists-p bcj-init-dir)
    (dolist (file (directory-files bcj-init-dir t "\\.el$"))
      (load file)))

(require 'mydefuns) ;; some custom functions

;;TODO
;; organization...
;; tabs.el: make it work especially show-autocomplete &filepath completions
;; look at projectile


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))) t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#002b36")
 '(background-mode dark)
 '(custom-safe-themes (quote ("594f6f7f69f793be48f724da6b709e8b68733eac4bd124f30787945183bc8143" "123ca1ac749fb7b833887826d4e20b7784e0e531e98ae3bd49c2da9419090cf1" "991cf420b68c962d1e028a0e8f431d4844b9435eeb73ccac4a7fa48a86cc2091" "afefae65aa22b1611646ce20cf3ec8077d32f769b24c5c097364cb60a2cfba62" "fb29b15f609fbbcadded132737b0271a5195b861c7548d60b024abd39ce158de" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "ddccd8fc03f09fb432acd73ba957df0baf764d8f3cb9045c2a77fc0fee8f54b9" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(fci-rule-color "#383838")
 '(flycheck-highlighting-mode (quote symbols))
 '(foreground-color "#839496")
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt yas-dropdown-prompt yas-x-prompt yas-no-prompt))))
