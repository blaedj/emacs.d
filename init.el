;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ...
(setq inhibit-startup-message t)
					;Load path list
(add-to-list 'load-path "~/.emacs.d/")

(if (< (string-to-number emacs-version) 24)
    (setq outdated t)
  ) ; for compatibility with emacs 23


(add-to-list 'load-path "~/emacs.d/elpa/")
(add-to-list 'load-path "~/emacs.d/site-lisp/")
					;(print load-path)
;; load sub-dirs
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))


(add-to-list 'Info-default-directory-list "/usr/share/info/emacs-24")
(add-hook 'Info-mode-hook		; After Info-mode has started
	  (lambda ()
    	    (setq Info-additional-directory-list Info-default-directory-list)
	    ))

;;TODO
;; organization...
;; tabs.el: make it work? especially show-autocomplete and filepath completions
;; look for better/faster way to open files, a la sublime text

;(global-linum-mode -1)

(require 'dired-details)
(require 'dired-details+)
(setq dired-details-hidden-string "" )

(add-hook 'code-modes-hook (lambda ()(linum-mode 1)))

(require 'autopair)
(autopair-mode)
(global-subword-mode t)
(require 'smex)

(require 'mydefuns) ;; some custom functions
(require 'sr-speedbar)

;;Marmalade package repo for package.el
(unless  (boundp 'outdated)
  (require 'package)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  )

;;---updated ruby mode---
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode) )
(add-hook 'ruby-mode-hook
	  (lambda () (run-hooks 'code-modes-hook)))
;;---

(add-hook 'emacs-lisp-mode-hook (lambda () (run-hooks 'code-modes-hook)))



;; ;;---inf-Ruby---
;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;; (autoload 'inf-ruby-keys "inf-ruby" "" t)
;; (eval-after-load 'ruby-mode
;;   '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
;;-------------------------------------------------------

;;---Java Stuff---
(add-hook 'java-mode-hook (lambda ()
			    ;; turn on auto-revert to deal with switching between
			    ;; emacs and eclispe
			    (auto-revert-mode t)
			    ;; turn on autopair
			    (autopair-mode)
			    (run-hooks 'code-modes-hook)
			    ))


;;---Javascript Stuff---
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t))
	  (run-hooks 'code-modes-hook)
	  )

;;---Markdown Mode---
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;;---Org-mode stuff---;
					;(require 'org-export)
					;(require 'org-md )


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
                 (concat user-emacs-directory "backups1")))))
(setq vc-make-backup-files t)

					;(set-frame-font "DejaVu Sans Mono-12")
					;(set-frame-font "Ubuntu Mono-14")
					;(set-frame-font "Andale Mono 13")
					;(set-frame-font "Monaco 11") ; great font, may need to install on non-macs

(fset 'yes-or-no-p 'y-or-n-p)       ;use y/n instead of yes/no
(setq tab-width 2)
(setq tabs-mode nil)
(setq transient-mark-mode t)        ;transient mark mode, can never remember what this is, but its probably important
(setq user-mail-address "blaedj@gmail.com")
(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))  ;remove unneccesary whitespace before saving a file
(setq standard-indent 2)            ;Set indentation to 2 spaces

(require 'ido)
(ido-mode t)                       ;Enable "interactive-do"-mode
(show-paren-mode t)                ;show matching paren mode

;;*******COLORS ----------------------------------------------------0

;;(unless  (boundp 'outdated)
(if (boundp 'outdated)
    (require 'color-theme)
  ;; FIXME if outdated, set the color theme as well as requiring color-theme
  ;;	(color-theme-oswald)
  )
					;(set-cursor-color "magenta2")
					;(set-mouse-color "green")
					;(load-theme 'solarized-dark t)'
(unless (boundp 'outdated)
  (add-to-list 'custom-theme-load-path "/home/blaed/.emacs.d/elpa/customThemes/")
  (load-theme 'solarized-dark t)
  )

;;set the color theme on startup
					;(add-hook 'emacs-startup-hook 'color-theme-oswald)

(set-face-foreground 'secondary-selection "skyblue")
;;------------------------------------------------------------------0
(setq initial-frame-alist '((width . 100) (height . 54)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "HotPink" :foreground "black"))))
 '(js2-warning ((t (:underline "orange"))) t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("ddccd8fc03f09fb432acd73ba957df0baf764d8f3cb9045c2a77fc0fee8f54b9" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(send-mail-function (quote mailclient-send-it)))
(put 'upcase-region 'disabled nil)
