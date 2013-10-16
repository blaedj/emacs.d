



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
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))))
 '(flycheck-error ((t (:underline "Red1"))))
 '(show-paren-match ((t (:background "DeepSkyBlue" :foreground "slate gray")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#657b83")
 '(custom-safe-themes (quote ("ac1dcedb1cf547d01defed0c1f0b9718c48a4711983ad337ca637d09d32dbc54" "2c16cb884154e4ce878e081b41e80a7af57f0ac2d666faee181f5982d2f34ad4" "3ea352122383a42e94ec019983955cb666856458aaa7d90f303f66e3a26b23d6" "d63fbb382f38c7a17f8d2875f4ff15c54dfadb8eb86993a992a1b93af6417f07" "5628c91cd5959ba465b33b5a2439d8471bca4362b6b0d17b571091aeda719d58" "e04c49d4d01c4fe6d2c75c4255f77853b13c9490f26537dd4286dfd4724c319d" "9d7f9f4d4040e89f4bb510fae631aa36740714322b60845662c4dba723ce7c3c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "594f6f7f69f793be48f724da6b709e8b68733eac4bd124f30787945183bc8143" "123ca1ac749fb7b833887826d4e20b7784e0e531e98ae3bd49c2da9419090cf1" "991cf420b68c962d1e028a0e8f431d4844b9435eeb73ccac4a7fa48a86cc2091" "afefae65aa22b1611646ce20cf3ec8077d32f769b24c5c097364cb60a2cfba62" "fb29b15f609fbbcadded132737b0271a5195b861c7548d60b024abd39ce158de" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "ddccd8fc03f09fb432acd73ba957df0baf764d8f3cb9045c2a77fc0fee8f54b9" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(fci-rule-color "#383838")
 '(flycheck-highlighting-mode (quote symbols))
 '(foreground-color "#839496")
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it))
 '(yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt yas-dropdown-prompt yas-x-prompt yas-no-prompt))))
