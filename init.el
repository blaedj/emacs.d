;; default load path
(add-to-list 'load-path "/home/blaed/.emacs.d/")
(add-to-list 'load-path "~/emacs.d/elpa/")
(add-to-list 'load-path "~/emacs.d/elpa/dired-details-1.3.1/")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/snippets")
(add-to-list 'load-path "~/.emacs.d/elpa/autopair-0.3/")

;(require 'dired-details+)
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")

(require 'autopair)
(autopair-global-mode)
(global-subword-mode t)
;(add-hook js2-mode-hook)
;;TODO
;;  -org mode research
;;  -multiple-cursors on github

;;Marmalade package repo for package.el
(require 'package)
(add-to-list 'package-archives
						 '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;---updated ruby mode---
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(setq inhibit-startup-screen t)
;;---

;;---inf-Ruby---
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
;;-------------------------------------------------------

;;---Yaml-Mode---;
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;---------auto-complete mode----------------------------
(require 'auto-complete-config)           ;load the default configuration
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/blaed/.emacs.d/ac-dict")  ;make sure we can find the dictionaries
(global-auto-complete-mode t)

(setq ac-auto-start 1)                    ;set ac to start after 1 character is typed

;;set tab to display auto complete?...

;;---yasnippet---
(require 'yasnippet)
(yas/global-mode 1)
(yas-load-directory "~/.emacs.d/plugins/yasnippet/")         ;Load the snippet files
;(setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(add-to-list 'ac-sources 'ac-sources-yasnippet)  ;put snippets in ac dropdown

;;---Wrap-region---
(require 'wrap-region)
(add-hook 'html-mode-hook 'wrap-region-mode)
;(setq 'wrap-re)

;;---ASM-MIPS mode---
(setq asm-comment-char "#")

;;--GENERAL KEY REMAPPINGS----------

(global-unset-key "\C-z")             ;make C-x z undefined, don't freeze emacs...
(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
;;----------

;;deal with autosave and backup files
;;Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
'(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
'(backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;;-----Get rid of the training wheels-----------------------
(tool-bar-mode -1)                  ;turn off toolbar on startup
(set-scroll-bar-mode nil)           ;turn off scroll bars
;(menu-bar-mode -99)                 ;turn off menu bar
; decided not to turn off the menu bar because I can use the system titlebar on linux and probably on a mac
(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
;;---------------------------------------------------------


(setq transient-mark-mode t)        ;transient mark mode
(setq user-mail-address "blaedj@gmail.com")
(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))  ;remove unneccesary whitespace before saving a file
(setq standard-indent 2)            ;Set indentation to 2 spaces
(setq tab-width 2)
(setq tabs-mode nil)

(require 'ido)
(ido-mode t)                       ;Enable "interactive-do"-mode
(show-paren-mode t)                ;show matching paren mode

;;*******COLORS ----------------------------------------------------0
(require 'color-theme)
;; Set cursor color
(set-cursor-color "magenta2")
;; Set mouse color
(set-mouse-color "green")
;;set the color theme on startup
(add-hook 'emacs-startup-hook 'color-theme-oswald)

(add-to-list 'default-frame-alist '(background-color . "#555"))
(set-background-color "#141414")
;;; Set highlighting colors for isearch and drag

(set-face-foreground 'highlight "MediumOrchid4")
(set-face-background 'highlight "#000")
(set-face-background 'region "#000")
(set-face-foreground 'secondary-selection "skyblue")
;;------------------------------------------------------------------0

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "black" :foreground "MediumOrchid4"))))
 '(js2-warning ((t (:underline "orange")))))
(put 'narrow-to-region 'disabled t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it)))
