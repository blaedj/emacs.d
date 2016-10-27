;;; major_modes_code -- setup and hooks for the major modes
;;; Commentary:
;;; mostly hooks for the various coding modes.
;;; Code:
(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight)
  (linum-mode 1)
  ;;(fci-mode t) disabling because this bugs out auto-complete popups
  ;;(add-hook 'before-save-hook (lambda ()(delete-trailing-whitespace)))  ;remove unneccesary whitespace before saving a file
  (add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)

  (auto-complete-mode 1)
  (bcj-ac-setup)
  (local-set-key (kbd "C-c C-e") 'hs-toggle-hiding)

  (smartparens-mode 1)
  (show-smartparens-mode 1)

  (hs-minor-mode 1)
  (yas-minor-mode 1)
  (flycheck-mode 1)
  (local-set-key (kbd "C-c '") 'flycheck-next-error)
  )

(defun my-experimental-coding-hook ()
  (make-local-variable 'column-number-mode)
  ;;(fci-mode t) disabling because this bugs out auto-complete popups
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
  (setq web-mode-markup-indent-offset 2 )
  )


(defun cpp-coding-hook ()
  (make-local-variable 'column-number-mode)
  ;;(fci-mode t) disabling because this bugs out auto-complete popups
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
  )


;; thanks to:
;;webcache.googleusercontent.com/search?q=cache:blog.ryuslash.org/archives/2013/01/25/highlight-vc-diffs
;; for this solution to git-gutter-fringe not updating on save.
;; also could check out diff-hl-mode
;; (defun maybe-use-git-gutter ()
;;   "run 'git-gutter' if the current file is being tracked by git"
;;   (when (eq (vc-backend (buffer-file-name)) 'Git)
;;     (git-gutter)))

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
(add-hook 'elixir-mode-hook 'my-coding-hook)
;;(add-to-list 'elixir-mode-hook 'auto-activate-ruby-end-mode-for-elixir-mode)

(add-hook 'html-mode-hook 'wrap-region-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)



(add-hook 'scss-mode-hook rainbow-mode)
;; don't try to compile the scss (sass) files on save. working in rails, the load paths are usually determined by sprockets
(setq scss-compile-at-save nil)

(require 'projectile)
(projectile-global-mode)

(require 'rspec-mode)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it
    ))

(defadvice rspec-compile (after hide-rspec-buffer activate)
  ;; (message "it ran!!")
  ;; (window--delete (get-buffer-window (get-buffer "*rspec-compilation*") "visible"))
  )

;; (defadvice kill-line (after say-ouch activate)
;;   (message "Ouch!"))

(ad-activate 'rspec-compile)

(setq rspec-use-rake-when-possible nil)

;; we want the compilation buffer to scroll to the bottom of the output
(setq compilation-scroll-output t)

(eval-after-load 'rspec-mode
  '(robe-mode))



(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)

(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)

(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'setup-robe-ac)

;;(require 'seeing-is-believing)
(add-hook 'ruby-mode-hook 'seeing-is-believing)

;;wrapper for ac-robe-setup so that we can disable it easily if it is too slow
(defun setup-robe-ac ()
  (ac-robe-setup))

(defun rob-mode-setup ()
  "DOCSTRING"
  (interactive)
  (let (var1)
    (setq var1 some)

    ))

;; this might make sure that we are using the correct ruby version with robe.
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))



;; (custom-set-variables
;;  '(ac-etags-requires 1))

;; (eval-after-load "etags"
;;   '(progn
;;      (ac-etags-setup)))

;; (defun bcj/ac-etags-setup-hook ()
;;     (add-to-list 'ac-sources 'ac-source-etags))

;; (add-hook 'ruby-mode-hook 'bcj/ac-etags-setup-hook)


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
  "Set some keybindings for js2-mode error jumping, set indent step to 2 spaces"
  (local-unset-key (kbd "C-c `"))
  (local-set-key (kbd "C-c `") 'js2-next-error )
  (unless (>= emacs-major-version 25)
    ;; if emacs-major-version < 25, js2-mode will not use js-mode's indentaion
    ;; behavior, so set js2's indentation offset.
    (setq 'js2-basic-offset 2))
  ;; properly format the braces and parens before saving a js file.
  ;; See init.d/mydefuns.el to update formatBuf behavior.
  (add-hook 'before-save-hook
	    (lambda ()
	      (formatBuf))))

(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
	    (setq js-indent-level 2) ; set indentation level
	    (if (< emacs-major-version 25)
		;;set js2 indentaiont if major version is < 25.
		;; if emacs-major-version < 25, js2-mode will not use js-mode's indentaion
		;; behavior, so set js2's indentation offset.
		(setq js2-basic-offset 2))
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
(add-to-list 'auto-mode-alist '("\\.riif\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.vm\\'" . web-mode) )
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode) )
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode) )

(add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-mode) )

(add-hook 'web-mode-hook (lambda()
			   (hs-minor-mode -1)))

(add-hook 'web-mode-hook #'(lambda ()
			     (yas-activate-extra-mode 'html-mode)))

(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'cmake-mode )
(add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))

(require 'flycheck)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(setq c-default-style "gnu")

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

(add-hook 'coffee-mode-hook (lambda () (highlight-indentation-mode)))


(custom-set-variables '(coffee-tab-width 2))

(setq magit-push-always-verify nil)

(add-hook 'package-menu-hook (lambda () "turn on hl-highlight-line mode"  (hl-line-mode)))

(autoload 'jq-mode "jq-mode.el"
    "Major mode for editing jq files" t)
(add-to-list 'auto-mode-alist '("\\.jq$" . jq-mode))

;; customize flycheck

;; redefine flycheck-display-error-messages so that multple errors are seperated
;; by only one newline, not 2
(defun flycheck-display-error-messages (errors)
  "Display the messages of ERRORS.

Concatenate all non-nil messages of ERRORS separated by 1 empty
line, and display them with `display-message-or-buffer', which
shows the messages either in the echo area or in a separate
buffer, depending on the number of lines.  See Info
node `(elisp)Displaying Messages' for more information.

In the latter case, show messages in
`flycheck-error-message-buffer'."
  (when (and errors (flycheck-may-use-echo-area-p))
    (let ((messages (seq-map #'flycheck-error-format-message-and-id errors)))
      (display-message-or-buffer (string-join messages "\n")
                                 flycheck-error-message-buffer
                                 'not-this-window))))

(provide 'major_modes_code)
;;; major_modes_code.el ends here
