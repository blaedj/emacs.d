
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ...
(setq inhibit-startup-message t)

;(setq debug-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#657b83")
 '(custom-safe-themes
   (quote
    ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "a37600b047da389eccc4a17b5f165d512fb1d32f18d93cffb28154b5f4eb4437" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "ef6c0f39c70c5822e62eb86f8ee8414f10590e73bcddf8c01f3b9d87b6bcd923" "1dbb83e5d78d218ffb3b8516ca8675b3229d4404dda272dc1e3ce9e4c6f8d5a0" "65ae93029a583d69a3781b26044601e85e2d32be8f525988e196ba2cb644ce6a" "70053ac78af15b0bdc93f4aea748b2e43e4e578b068600c3e32d468175f143bd" "ac1dcedb1cf547d01defed0c1f0b9718c48a4711983ad337ca637d09d32dbc54" "2c16cb884154e4ce878e081b41e80a7af57f0ac2d666faee181f5982d2f34ad4" "3ea352122383a42e94ec019983955cb666856458aaa7d90f303f66e3a26b23d6" "d63fbb382f38c7a17f8d2875f4ff15c54dfadb8eb86993a992a1b93af6417f07" "5628c91cd5959ba465b33b5a2439d8471bca4362b6b0d17b571091aeda719d58" "e04c49d4d01c4fe6d2c75c4255f77853b13c9490f26537dd4286dfd4724c319d" "9d7f9f4d4040e89f4bb510fae631aa36740714322b60845662c4dba723ce7c3c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "594f6f7f69f793be48f724da6b709e8b68733eac4bd124f30787945183bc8143" "123ca1ac749fb7b833887826d4e20b7784e0e531e98ae3bd49c2da9419090cf1" "991cf420b68c962d1e028a0e8f431d4844b9435eeb73ccac4a7fa48a86cc2091" "afefae65aa22b1611646ce20cf3ec8077d32f769b24c5c097364cb60a2cfba62" "fb29b15f609fbbcadded132737b0271a5195b861c7548d60b024abd39ce158de" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "ddccd8fc03f09fb432acd73ba957df0baf764d8f3cb9045c2a77fc0fee8f54b9" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(flycheck-highlighting-mode (quote symbols))
 '(foreground-color "#839496")
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it))
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-completing-prompt yas-dropdown-prompt yas-x-prompt yas-no-prompt))))

;;(setq initial-frame-alist '((width . 165) (height . 100)))
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

;;(x-focus-frame nil)
;;TODO

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))) t))



(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
