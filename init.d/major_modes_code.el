(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight)
  (linum-mode 1)
  (auto-complete-mode 1)
  (smartparens-mode 1)
  ;; temporarily deprecated to try out smartparens
					;(autopair-mode 1)
  (hs-minor-mode 1)
  (yas-minor-mode 1)
  )

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
(add-hook 'js-mode-hook 'my-coding-hook)
(add-hook 'csharp-mode-hook 'my-coding-hook)
(add-hook 'css-mode-hook 'my-coding-hook)
(add-hook 'html-mode-hook 'my-coding-hook)
(add-hook 'web-mode-hook 'my-coding-hook)
(add-hook 'c++-mode-hook 'my-coding-hook)
(add-hook 'c-mode-hook 'my-coding-hook)
(add-hook 'cmake-mode-hook 'my-coding-hook)
(add-hook 'java-mode-hook 'my-coding-hook)

(add-hook 'html-mode-hook 'wrap-region-mode)

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

					;(require 'project-explorer)
(require 'projectile)
(projectile-global-mode)

(require 'rspec-mode)
;; (defadvice rspec-compile (around rspec-compile-around)
;;   "Use BASH shell for running the specs because of ZSH issues."
;;   (let ((shell-file-name "/bin/bash"))
;;     ad-do-it))
;; (ad-activate 'rspec-compile)
					;(require 'ruby-end)
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)

					;(add-hook 'ruby-mode-hook (lambda()(ruby-end-mode 1)))
;; (eval-after-load 'rspec-mode
;;   '(rspec-install-snippets))

;;---inf-Ruby---
(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
;;-------------------------------------------------------
(add-hook 'ruby-mode-hook 'my-coding-hook)

(setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))

;;---Java Stuff---
(add-hook
 'java-mode-hook
 (lambda ()
   ;; turn on auto-revert to
   ;;deal with switching between
   ;; emacs and eclispe, netbeans etc
   (auto-revert-mode t)
   ))

;;---Javascript Stuff---
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
	    (run-hooks 'code-modes-hook)
	    ))
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

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode) )
(add-hook 'web-mode-hook (lambda()
			   (hs-minor-mode -1)))

(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'cmake-mode )
(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))


;; C/C++ mode
(require 'flycheck)
(add-hook 'c++-mode-hook #'flycheck-mode)
(add-hook 'c-mode-hook #'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
