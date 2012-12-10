



;; default load path
(add-to-list 'load-path "/home/blaed/.emacs.d/")
(add-to-list 'load-path "/home/blaed/.emacs.d/elpa/color-theme-twilight-0.1/")
;;(add-to-list 'load-path "/home/blaed/.emacs.d/dired-details+.el")

(require 'dired-details+)

;;Marmalade package repo for package.el
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;;Python-Mode.el
(add-to-list 'load-path "/home/blaed/.emacs.d/plugins/python-mode.el-6.0.12") 
(setq py-install-directory "/home/blaed/.emacs.d/plugins/python-mode.el-6.0.12")
(require 'python-mode)


;;The following lines are for auto-complete-mode
;;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
;;load the default configuration
(require 'auto-complete-config)
;;make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")
(ac-config-default)

;;turn on auto-complete-mode globally, turn off using M-x auto-complete-mode...
(global-auto-complete-mode t)
;;set ac to start after 1 character is typed
(setq ac-auto-start 1)
;;end auto complete mode
;;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

;;Wrap-region------------------------------------------
(add-to-list 'load-path "/home/blaed/.emacs.d/elpa/wrap-region-0.6.0")
(require 'wrap-region)
(add-hook 'html-mode-hook 'wrap-region-mode)

;;Attempt to set the color theme on startup
(add-hook 'emacs-startup-hook 'color-theme-comidia)
;;-----------------------------------------------------

;;yasnippet plugin
;;_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
;;Load the snippet files
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets/text-mode")
;;put snippets in autocomplete dropdown mode
(add-to-list 'ac-sources 'ac-sources-yasnippet)

;Set environment preferences
;;*************************************************************************
;;make C-x z undefined, sick of accidentally freezing emacs...
(global-unset-key "\C-z")

(global-set-key "\C-x\C-m" 'execute-extended-command)

;;Set innitial buffer on opening
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js2-allow-keywords-as-property-names nil)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 ;;deal with autosave and backup files
 ;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;;turn off toolbar on startup, to turn on type M-x tool-bar-mode
(tool-bar-mode -1)
;;turn off scroll bars, to turn on: M-x scroll-bar-mode
(set-scroll-bar-mode nil)
;;turn off menu bar, to turn back on: c-mouse3
(menu-bar-mode -99)

;;make "y" or "n" sufficient for "yes" and "no"
(fset 'yes-or-no-p 'y-or-n-p)

;;---Set indentation to 2 spaces
(setq standard-indent 2)
(setq tab-width 2)
;;(js2-mode tab-width 2)

;;************************************************************************

;;*******************inf-Ruby****************************************
 (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
    (autoload 'inf-ruby-keys "inf-ruby" "" t)
    (eval-after-load 'ruby-mode
      '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
;********************************************************************

;;COLORS -----------------------------------------------------------------
;; Set cursor color
(set-cursor-color "medium spring green")
     
;; Set mouse color
(set-mouse-color "green")
     
;; Set foreground and background
;(set-foreground-color "yellow")
;(set-background-color "#130f28")

(require 'color-theme)
;(color-theme-initialize)
;(load-file "~/.emacs.d/elpa/color-theme-twilight-0.1/color-theme-twilight.el")
;(color-theme-twilight)


;;; Set highlighting colors for isearch and drag
(set-face-foreground 'highlight "MediumOrchid4")
(set-face-background 'highlight "chartreuse2")
     
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
     
(set-face-foreground 'secondary-selection "skyblue")

;;-----------------------------------------------------------------------



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-warning ((t (:underline "orange")))))
(put 'narrow-to-region 'disabled t)
