;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; default load path
(add-to-list 'load-path "~/.emacs.d/")
;;(add-to-list 'load-path "~/.emacs.d/elpa/ido-ubiquitous-1.6")
(let ((default-directory "~/.emacs.d/elpa"))
  (normal-top-level-add-subdirs-to-load-path))

                                        ;(server-start)

(require 'ace-jump-mode)
(require 'smartparens)
(desktop-save-mode -1)
(require 'dired-details+)
(require 'idle-highlight)
(require 'projectile)
(projectile-global-mode)

(require 'highlight)
(require 'highlight-parentheses)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(require 'smartscan)
                                        ;(setq 'smartscan-use-extended-syntax t)

(require 'mustache-mode)

(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)


(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  ;; (idle-highlight-mode t)
  (idle-highlight)
  (linum-mode)
  ;; (company-mode 1)
   (auto-complete-mode 1)
  (hs-minor-mode)
  (git-gutter-mode 1)
  (highlight-parentheses-mode)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)
  )
(smartparens-global-mode)

(defun web-mode-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  ;; (idle-highlight-mode t)
  (linum-mode)
  (auto-complete-mode 1)
  (git-gutter-mode 1)
  (highlight-parentheses-mode)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)
  )

(require 'company)

(defun experimental-coding-hook ()
  "experiments"
  (company-mode 1)
  (git-gutter-mode 1)
  (highlight-parentheses-mode)
)

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
(add-hook 'js-mode-hook 'my-coding-hook)
(add-hook 'csharp-mode-hook 'my-coding-hook)
;(add-hook 'csharp-mode-hook 'experimental-coding-hook)
(add-hook 'css-mode-hook 'my-coding-hook)
(add-hook 'html-mode-hook 'my-coding-hook)
(add-hook 'web-mode-hook 'web-mode-coding-hook)
(add-hook 'coffee-mode-hook 'my-coding-hook)
(add-hook 'coffee-mode-hook 'coffee-compile-on-save)

(defun coffee-compile-on-save ()
  "Compile '.coffee' files on every save"
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))


;;use ido nearly everywhere
(require 'ido-ubiquitous)
(require 'ido)
;; Fuzzy search matching for ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; Use Emacs terminfo, not system terminfo: (Why?)
(setq system-uses-terminfo nil)
;;M-x set-terminal-coding-system and setting it to utf-8-unix

(setq org-agenda-files(list "~/org/notes.org"
                            "~/org/todo.org"
                            "~/org/WeeklyMeeting.org"))
(defun  bcj-org-mode-defun ()
  "Some customizations to org mode"
  (local-unset-key (kbd "C-c SPC"))
  (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
  )
(add-hook 'org-mode-hook 'bcj-org-mode-defun)

;;Marmalade package repo for package.el
(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
;;Melpa package repository
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'mydefuns ) ; some custom functions
(require 'php-mode)

;;--Javascript--;;
(require 'js2-mode)
(defun js2-hook ()
  "Set some keybindings for js2-mode error jumping"
  (interactive)
  (local-unset-key (kbd "C-c `"))
  (local-set-key (kbd "C-c `") 'js2-next-error ))

(add-hook 'js2-mode-hook
          '(lambda ()
             (js2-hook)))

(setq auto-mode-alist
      (append '(("\\.js\\'" . js2-mode)) auto-mode-alist))

;; format the spacing between close-paren and open-brace before save
(add-hook 'js2-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook
                       (lambda ()
                         (formatBuf)))))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; After js2 has parsed a js file, we look for jslint globals decl comment ("/* global Fred, _, Harry */") and add any symbols to a buffer-local var of acceptable global vars
(add-hook 'js2-post-parse-callbacks
          (lambda ()
            (when (> (buffer-size) 0)
              (let ((btext (replace-regexp-in-string
                            ": *true" " "
                            (replace-regexp-in-string "[\n\t ]+" " " (buffer-substring-no-properties 1 (buffer-size)) t t))))
                (mapc (apply-partially 'add-to-list 'js2-additional-externs)
                      (split-string
                       (if (string-match "/\\* *global *\\(.*?\\) *\\*/" btext) (match-string-no-properties 1 btext) "")
                       " *, *" t))
                ))))

(add-hook 'js2-mode-hook 'my-coding-hook)

(defun js-boilerplate ()
  (if (not (file-exists-p (buffer-file-name (current-buffer))))
      (cond
       ((string-match "\.js$" buffer-file-name)
        (insert
         "/* global define */"))
       )))

(add-hook 'js2-mode-hook 'js-boilerplate)

;;--Coffescript--;;
(require 'coffee-mode)
(setq coffee-tab-width 2)
(setq coffee-command "coffee")

;;-- Web-mode--;;
;;(require 'web-mode)

;;--C-Sharp Mode--;;
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  ;;(require 'flymake)
  (flymake-mode-off)
  (turn-on-auto-revert-mode)
  (setq indent-tabs-mode nil)
  (setq autopair-mode nil)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-fn)

;;--CSS-Mode--;;
(defun my-css-mode-fn ()
  "hook for css mode"
  (rainbow-mode 1)
  )
(add-hook 'css-mode-hook 'my-css-mode-fn t)


(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

(require 'auto-complete)
(require 'auto-complete-config)          ;load the default configuration
                                        ;make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "/home/bjohnsto/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start 1)                ;set ac to start after 1 char is typed
(setq ac-auto-show-menu 0.1)
(setq ac-use-fuzzy t)   ;use fuzzy matching
;;(add-to-list 'ac-sources 'ac-sources-yasnippet)  ;load snippets in ac dropdown mode
;;(require 'my-yas-funs)
;;(delq 'ac-sources-yasnippet ac-sources)

;;------------End auto-complete mode-------------------

;;Wrap-region
;;(require 'wrap-region)

;;remove unneccesary whitespace before saving a file
(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)) )

;;yasnippet plugin-------
(require 'yasnippet)
(yas/global-mode 1)
(yas/load-directory "/home/bjohnsto/.emacs.d/snippets")
;; choose how to prompt for a snippet, eg when 2 snippets share a key
(setq yas-prompt-functions (quote (yas-ido-prompt yas-completing-prompt yas-dropdown-prompt yas-x-prompt yas-no-prompt)))
;; General keybindings/remappings-----

;;(global-unset-key "\C-z")                 ;make C-x z undefined
(require 'smex)
(global-set-key "\C-x\C-m" 'smex)         ; smarter m-x
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)


(put 'set-goal-column 'disabled nil)
(global-unset-key (kbd "C-x C-n")) ;Tired of accidently hitting this

(global-set-key (kbd "\C-c SPC") 'ace-jump-mode)
;; like js-mode's jump-to-symbol
(global-set-key (kbd "C-.") 'imenu-anywhere)
;; (global-set-key (kbd "M-p") 'previous-multiframe-window )
;; (global-set-key (kbd "M-n") 'next-multiframe-window )
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-M-=") 'text-scale-decrease)

(global-set-key (kbd "C-x r p") 'replace-rectangle)

(global-set-key (kbd "M-n") 'smartscan-symbol-go-forward)
(global-set-key (kbd "M-p") 'smartscan-symbol-go-backward)


(defun google-search (query)
  "Searches google for a given query"
  (interactive "sQuery:")
  (browse-url (concat "http://www.google.com/search?q=" query)))

(global-set-key (kbd "\C-x g") 'google-search)

(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(setq yas/trigger-key "TAB")

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)



;; from avdi grimm's blog
(defun bcj-revert-buffer-no-confirm ()
  "Revert buffer with no confirmation"
  (interactive)
  (revert-buffer nil t))
(global-set-key (kbd "<f5>") 'bcj-revert-buffer-no-confirm)

(show-paren-mode t)             ;match the parens
(make-directory "~/.emacs.d/autosaves/" t)  ; create the autosave directory

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(company-idle-delay 0.10000000000000001)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes (quote ("70053ac78af15b0bdc93f4aea748b2e43e4e578b068600c3e32d468175f143bd" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "9145e7a7cc3b3d9f2e619c21dba1ff3eb27fb5d0ea398762d620f524e8c58cbb" "9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js2-allow-keywords-as-property-names nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indentp t)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(newsticker-url-list (quote (("arstechnicaAll" "http://feeds.arstechnica.com/arstechnica/index" nil nil nil))))
 '(org-agenda-files (quote ("~/org/notes.org" "~/org/WeeklyMeeting.org")) t)
 '(send-mail-function (quote mailclient-send-it))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 30) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(vc-annotate-background "#2b2b2b")
 '(vc-annotate-color-map (quote ((20 . "#bc8383") (40 . "#cc9393") (60 . "#dfaf8f") (80 . "#d0bf8f") (100 . "#e0cf9f") (120 . "#f0dfaf") (140 . "#5f7f5f") (160 . "#7f9f7f") (180 . "#8fb28f") (200 . "#9fc59f") (220 . "#afd8af") (240 . "#bfebbf") (260 . "#93e0e3") (280 . "#6ca0a3") (300 . "#7cb8bb") (320 . "#8cd0d3") (340 . "#94bff3") (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3")
 '(x-stretch-cursor t))

(global-subword-mode 1)           ; recognize camelCase, _, etc globally
(set-default 'cursor-type 'box)         ;make cursor a block cursor
(setq user-mail-address "blaedj@gmail.com")    ; set email address
(fset 'yes-or-no-p 'y-or-n-p)           ;use 'y/n' in place of 'yes/no'
(setq visible-bell 1)                   ;No dinging please!!!!!

(setq standard-indent 2)                ; Set indentation to 2 spaces
(setq tab-width 2)                      ; set tabs to width of 2 spaces
(setq-default indent-tabs-mode nil)     ; tabs are evil
;;(set-frame-font "Monaco 10")
(set-frame-font "Anonymous Pro 13")
;; (set-frame-font "DejaVu Sans Mono 12")

;;COLORS -----------------------------------------------------------------
(require 'color-theme)

(load-theme 'solarized-dark-custom 't)

(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))  ;;open cshtml files w/web-mode
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . html-mode))  ;;  open aspx/ascx files   with html mode
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter-fr:added ((t (:foreground "#7FcF7F" :weight bold))) t)
 '(git-gutter-fr:deleted ((t (:foreground "#fC6363" :weight bold))) t)
 '(git-gutter-fr:modified ((t (:foreground "#AC8CC3" :weight bold))) t)
 '(git-gutter:added ((t (:foreground "chartreuse" :inverse-video t :weight bold))))
 '(git-gutter:deleted ((t (:foreground "red2" :inverse-video t :weight bold))))
 '(git-gutter:modified ((t (:foreground "deep sky blue" :inverse-video t :weight bold))))
 '(js2-warning ((((class color) (min-colors 89)) (:underline "#cb4b16"))))
 '(linum ((t (:background "#8d8683" :foreground "#222"))))
 '(magit-item-highlight ((t nil))))
;; '(linum ((t (:background "#8d8683" :foreground "#4b5c69")))))
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;;SmartParens
(sp-pair "/*" "*//" )
