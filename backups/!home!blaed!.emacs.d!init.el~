;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

					;Load path list
					;/home/blaed/.emacs.d/elpa
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/emacs.d/elpa/")
(add-to-list 'load-path "~/emacs.d/lisp/")

;; load sub-dirs
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))

;;TODO
					; organization...
					; tabs.el: make it work? especially show-autocomplete and filepath completions
					; look for better/faster way to open files, a la sublime text

(require 'dired-details)
(require 'dired-details+)
(setq dired-details-hidden-string "" )
(require 'autopair)
(autopair-global-mode)
(global-subword-mode t)

;;Marmalade package repo for package.el
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;---updated ruby mode---
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;;---

;;---inf-Ruby---
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
;;-------------------------------------------------------

;;---Javascript Stuff---
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;;---Yaml-Mode---;
					;(require 'yaml-mode)
					;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

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
(yas-load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/") ;Load the snippet files
					;(setq yas-snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(yas-load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/text-mode/")
(add-to-list 'ac-sources 'ac-source-yasnippet)  ;put snippets in ac dropdown

;;---Wrap-region---
(require 'wrap-region)
(wrap-region-global-mode t)
(add-hook 'html-mode-hook 'wrap-region-mode)

;;---ASM-MIPS mode---
(setq asm-comment-char "#")

;;--GENERAL KEY REMAPPINGS----------

(global-unset-key "\C-z")             ;make C-x z undefined, don't freeze emacs...
(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
;;----------

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
;;---------------------------------------------------------


(setq transient-mark-mode t)        ;transient mark mode, can never remember what this is
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
(setq initial-frame-alist '((width . 100) (height . 54)))
(set-face-foreground 'secondary-selection "skyblue")
;;------------------------------------------------------------------0

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "HotPink" :foreground "black"))))
 '(js2-warning ((t (:underline "orange")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it)))
