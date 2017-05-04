(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "bc1c23c8fbc75a257f186ab05b8a02a804ff665dcb1383422441b87956514464" "70053ac78af15b0bdc93f4aea748b2e43e4e578b068600c3e32d468175f143bd" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(display-buffer-alist
   (quote
    (("^\\*Completions\\*" bcj/special-display)
     ("^\\*Help\\*" bcj/special-display)
     ("^\\*grep\\*" bcj/special-display)
     ("^\\*ag.*\\*" bcj/special-display)
     ("^\\*ag search.*\\*" bcj/special-display)
     ("^\\*Apropos\\*" bcj/special-display)
     ("^\\*Compile\\*" bcj/special-display)
     ("^\\*Occur\\*" bcj/special-display)
     ("^\\*Shell Command Output\\*" bcj/special-display)
     ("^\\*Async Shell Command\\*" bcj/special-display))))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (evil-goggles use-package indium web-mode ample-zen-theme restclient el2org smartparens vue-mode handlebars-mode dot-mode counsel yasnippet zeal-at-point yaml-mode www-synonyms wrap-region windresize w3m twilight-theme tomatinho swift-mode subatomic256-theme spaces solarized-theme smex smartscan smart-region smart-mode-line slime skewer-mode sicp scss-mode rvm rspec-mode robe rainbow-mode projectile project-explorer popup-complete php-mode paradox pallet org-gcal org-bullets names material-theme markdown-mode main-line magit keyfreq imenu-anywhere image+ ido-vertical-mode ido-ubiquitous highlight-indentation hide-lines haml-mode hackernews git-gutter-fringe flymake-coffee flycheck-elixir flycheck-color-mode-line flycheck-cask flx-ido floobits find-file-in-project fill-column-indicator figlet exec-path-from-shell evil ereader enh-ruby-mode emojify dumb-jump dash-at-point csv-mode cpputils-cmake company-quickhelp column-enforce-mode color-theme-solarized color-theme-approximate coffee-mode cmake-mode buffer-move bubbleberry-theme auto-org-md auto-complete-clang alchemist ag adaptive-wrap ace-window ace-jump-mode ac-etags ac-cider 2048-game)))
 '(paradox-automatically-star t)
 '(paradox-github-token t t)
 '(safe-local-variable-values
   (quote
    ((eval when
	   (fboundp
	    (quote rainbow-mode))
	   (rainbow-mode 1)))))
 '(smartparens-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "orange red" :foreground "#efefef" :weight normal))))
 '(hl-line ((t (:inverse-video t :underline nil))))
 '(magit-diff-added ((t (:inherit diff-added)))))
