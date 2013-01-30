;; default load path
(add-to-list 'load-path "/home/blaed/.emacs.d/")
(add-to-list  'load-path "~/emacs.d/elpa/*")
;(add-to-list  'load-path "~/emacs.d/elpa/color-theme-6.5.5/")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/snippets")
(add-to-list 'load-path "~/.emacs.d/elpa/autopair-0.3/")

(require 'dired-details+)
(require 'autopair)
(autopair-global-mode)

;;TODO
;;  -org mode research
;;  -multiple-cursors on github

;;Marmalade package repo for package.el
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;----------updated ruby mode----------------------------
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(setq inhibit-startup-screen t)
;;-------------------------------------------------------

;;------------inf-Ruby-----------------------------------
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
;;-------------------------------------------------------

;;---------auto-complete mode----------------------------
;;load the default configuration
(require 'auto-complete-config)
;;make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")
(ac-config-default)
;;turn on auto-complete-mode globally, turn off using M-x auto-complete-mode...
(global-auto-complete-mode t)
;;set ac to start after 1 character is typed
(setq ac-auto-start 1)

;;set tab to display auto complete?...

;;-------------------------------------------------------

;;-----------yasnippet plugin;;---------------------------

(require 'yasnippet)
(yas/global-mode 1)
;;Load the snippet files
(yas-load-directory "~/.emacs.d/plugins/yasnippet/")
(setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
;; ;;put snippets in autocomplete dropdown mode
 (add-to-list 'ac-sources 'ac-sources-yasnippet)
;;-------------------------------------------------------

;;-------------Wrap-region--------------------------------

(require 'wrap-region)
(add-hook 'html-mode-hook 'wrap-region-mode)
;;-------------------------------------------------------

;***************Set environment preferences*******************

;;--GENERAL KEY REMAPPINGS-----------------------
;;make C-x z undefined, don't freeze emacs...
(global-unset-key "\C-z")
;;alternative for M-x
;(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
;;-----------------------------------------------------

;;deal with autosave and backup files
;;Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
'(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
'(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;;-----Get rid of the training wheels-----------------------
;;turn off toolbar on startup, to turn on type M-x tool-bar-mode
(tool-bar-mode -1)
;;turn off scroll bars, to turn on: M-x scroll-bar-mode
(set-scroll-bar-mode nil)
;;turn off menu bar, to turn back on: c-mouse3
(menu-bar-mode -99)
;;make "y" or "n" sufficient for "yes" and "no"
(fset 'yes-or-no-p 'y-or-n-p)
;;---------------------------------------------------------

;;transient mark mode
(setq transient-mark-mode t)

(setq user-mail-address "blaedj@gmail.com")

;;remove unneccesary whitespace before saving a file
(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))

;;Set indentation to 2 spaces
(setq standard-indent 2)
(setq tab-width 2)

;;Enable "interactive-do"-mode
(require 'ido)
(ido-mode t)

;;show paren mode
(show-paren-mode t)

;;***********************************************************


;;*******COLORS ----------------------------------------------------0
(require 'color-theme)
;; Set cursor color
(set-cursor-color "magenta2")
;; Set mouse color
(set-mouse-color "green")
;;set the color theme on startup
(add-hook 'emacs-startup-hook 'color-theme-oswald)

;;; Set highlighting colors for isearch and drag
(set-face-foreground 'highlight "MediumOrchid4")
(set-face-background 'highlight "chartreuse2")
(set-face-foreground 'region "#000000")
(set-face-background 'region "chartreuse2")
(set-face-foreground 'secondary-selection "skyblue")
;;------------------------------------------------------------------0

(custom-set-faces
 ;; If there is more than one, they won't work right.
 '(js2-warning ((t (:underline "orange")))))
(put 'narrow-to-region 'disabled t)
