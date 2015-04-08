(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight)
  (linum-mode 1)
  (fci-mode t)
  ;;(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))  ;remove unneccesary whitespace before saving a file
  (add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)

  ;;(git-gutter-mode)
  ;;(git-gutter:linum-setup)

  (auto-complete-mode 1)
  (bcj-ac-setup)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)
  (smartparens-mode 1)
  (show-smartparens-mode 1)
  (hs-minor-mode 1)
  (yas-minor-mode 1)
  )

(defun my-experimental-coding-hook ()
  (make-local-variable 'column-number-mode)
  (fci-mode t)
  (column-number-mode t)
  (idle-highlight)
  (linum-mode 1)
  ;; (company-mode 1)
  (smartparens-mode 1)
  (hs-minor-mode 1)
  (yas-minor-mode 1)
  )

(defun web-mode-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (linum-mode 1)
  ;;(idle-highlight) makes web-mode lock up with message 'font-lock-highlight: untouched buffer (nil)'
  (bcj-ac-setup)
  ;;(smartparens-mode 1)
  ;;(show-smartparens-mode 1)
  ;;(hs-minor-mode 1)
  (add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)
  (yas-minor-mode 1)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-current-column-highlight t)
  (local-set-key (kbd "C-c w") 'web-mode-element-wrap)
  )


(defun cpp-coding-hook ()
  (make-local-variable 'column-number-mode)
  (fci-mode t)
  (column-number-mode t)
  (idle-highlight)
  (linum-mode 1)
  ;;(cppcm-reload-all)
  (bcj-ac-setup)
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
  (smartparens-mode 1)
  (show-smartparens-mode 1)
  (hs-minor-mode 1)
  (yas-minor-mode 1)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)
  ;;  (flycheck-mode)
  )

;; thanks to:
;;webcache.googleusercontent.com/search?q=cache:blog.ryuslash.org/archives/2013/01/25/highlight-vc-diffs
;; for this solution to git-gutter-fringe not updating on save.
;; also could check out diff-hl-mode
(defun maybe-use-git-gutter ()
  "run 'git-gutter' if the current file is being tracked by git"
  (when (eq (vc-backend (buffer-file-name)) 'Git)
    (git-gutter)))

;;(add-hook 'after-save-hook 'maybe-use-git-gutter)

;; for cpputils-cmake
;;(add-hook 'c-mode-hook (lambda () (cppcm-reload-all)))
;;(add-hook 'c++-mode-hook (lambda () (cppcm-reload-all)))

;; OPTIONAL, avoid typing full path when starting gdb
;; (global-set-key (kbd "C-c C-g")
;;  '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))



(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
(add-hook 'js-mode-hook 'my-coding-hook)
(add-hook 'csharp-mode-hook 'my-coding-hook)
(add-hook 'css-mode-hook 'my-coding-hook)
(add-hook 'html-mode-hook 'my-coding-hook)
(add-hook 'web-mode-hook 'web-mode-coding-hook)
(add-hook 'c++-mode-hook 'cpp-coding-hook)
(add-hook 'c-mode-hook 'cpp-coding-hook)
(add-hook 'coffee-mode-hook 'my-coding-hook)
(add-hook 'cmake-mode-hook 'my-coding-hook)
(add-hook 'java-mode-hook 'my-coding-hook)
(add-hook 'nxml-mode-hook 'my-coding-hook)
(add-hook 'html-mode-hook 'wrap-region-mode)

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;;(add-hook 'css-mode-hook rainbow-mode)
					;(require 'project-explorer)
(require 'projectile)
(projectile-global-mode)

(require 'rspec-mode)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;;(require 'ruby-end) ; not needed anymode, smartparens handles this
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)

(eval-after-load 'rspec-mode
  '(robe-mode))

;;---inf-Ruby---
(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
;;-------------------------------------------------------
(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'setup-robe-ac)

;;wrapper for ac-robe-setup so that we can disable it easily if it is too slow
(defun setup-robe-ac ()
  (ac-robe-setup))
;;(defun ac-robe-setup ()() )

(defun rob-mode-setup ()
  "DOCSTRING"
  (interactive)
  (let (var1)
    (setq var1 some)

    ))

;; this might make sure that we are using the correct ruby version with robe.
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))


;;(setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))

;;---Java Stuff---
(add-hook 'java-mode-hook
	  (lambda ()
	    (auto-revert-mode t)
	    (setq tab-width 4)
	    ;;(eclim-mode t)

	    ))

;;TODO: GET ECLIM WORKING
;; (setq eclim-auto-save t
;;       eclim-executable "~/.eclipse/org.eclipse.platform_4.3.0_1473617060_linux_gtk_x86_64/eclim"
;;       eclimd-executable "~/.eclipse/org.eclipse.platform_4.3.0_1473617060_linux_gtk_x86_64/eclimd"
;;       eclimd-wait-for-process nil
;;       eclimd-default-workspace "~/code/java/"
;;       )
;; (setq help-at-pt-display-when-idle t)
;; (setq help-at-pt-timer-delay 0.1)
;; (help-at-pt-set-timer)
;; add the emacs-eclim source


;;---Javascript Stuff---
(defun js2-hook ()
  "Set some keybindings for js2-mode error jumping"
  (interactive)
  (local-unset-key (kbd "C-c `"))
  (local-set-key (kbd "C-c `") 'js2-next-error )
  ;; properly format the braces and parens before saving a js file.
  (add-hook 'before-save-hook
	    (lambda ()
	      (formatBuf))))

(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
      	    (run-hooks 'code-modes-hook)
      	    (js2-hook)))

;;---Markdown Mode---
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.zsh-theme\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode) )
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode) )
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.riif\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.vm\\'" . web-mode) )
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode) )
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode) )


(add-hook 'web-mode-hook (lambda()
			   (hs-minor-mode -1)))

(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'cmake-mode )
(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))

(require 'flycheck)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(setq c-default-style "gnu")

;;git-gutter-fringe customizations
(setq git-gutter-fr:side 'left-fringe)
(setq-default left-fringe-width 15)

(defun bcj-ac-setup ()
  "setup auto-complete the way that I like it"
  (setq ac-auto-start 1)  ;set ac to start after 2 characters are typed
  (setq ac-auto-show-menu 0.1) ;show the menu almost immediately
  (setq ac-use-fuzzy t)   ;use fuzzy matching
  )

;;Clojure

;;ac-cider config
(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

;;(add-hook 'clojure-mode-hook '( '(my-coding-hook) (setq cider-lein-command "/usr/local/bin/lein")))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-lein-command "/usr/local/bin/lein" )

;; (require 'flymake)
;; (require 'flymake-coffee)
;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)
(setq flycheck-coffee-executable "/usr/local/bin/coffee")

(custom-set-variables '(coffee-tab-width 2))
