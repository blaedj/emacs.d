
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
