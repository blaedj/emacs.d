;;; z_keymaps.el -- My keybindings.
;;; Commentary:
;;; Code:

;;; GENERAL USABILITY -----------

(require 'mydefuns ) ;; so we can move these defuns out of the keymap file...
(global-set-key (kbd "<f5>") 'bcj-revert-buffer-no-confirm)
(global-set-key (kbd "<f6>") 'bcj-window-setup)

(global-set-key (kbd "\C-x m") 'smex) ; smarter M-x
(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x
(global-set-key (kbd "<menu>") 'smex)

;; mac switch meta key
(defun mac-switch-meta nil
  "Switch meta between Option and Command."
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )

;; (if (eq system-type 'darwin)
;;    (mac-switch-meta)
;; )








;;;;;;;; --- EDITING AND MANIPULATING TEXT --------

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)

;; make zap-to-char not delete the char provided
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
If you are deleting forward, the CHAR is replaced and the point is
put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))

;; shortcuts for changing the font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-M-=") 'text-scale-decrease)

(global-set-key (kbd "C-x r p") 'replace-rectangle)

(global-set-key (kbd "M-l") 'er/expand-region)
(global-set-key (kbd "M-L") 'er/contract-region)






;;;;;;; -- NAVIGATION AND MOVEMENT ---------------

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; make arrow keys navigate windows
(global-set-key (kbd "<down>") 'windmove-down)
(global-set-key (kbd "<left>") 'windmove-left)
(global-set-key (kbd "<right>") 'windmove-right)
(global-set-key (kbd "<up>") 'windmove-up)

(setq smartscan-symbol-selector "symbol")
(global-set-key (kbd "M-n") 'smartscan-symbol-go-forward )
(global-set-key (kbd "M-p") 'smartscan-symbol-go-backward)

;;better ways to jump to a specific window:
(global-set-key (kbd "C-x i") 'ace-window)
(global-set-key (kbd "C-x o") 'other-window)

;; create a scratch buffer of arbitrary type
(global-set-key (kbd "C-c C-s b") 'create-scratch-buffer)


;;(global-set-key (kbd "<tab>") 'hippie-expand  )
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-.") 'imenu-anywhere)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


;; documentation searching
(global-set-key (kbd "C-c C-d") 'devdocs-search)
(global-set-key "\C-cd" 'dash-at-point)



;;;;;;;; MAJOR MODE KEYBINDS --------------------

(defun bcj/org-keys ()
  "Remap some org keybindings."
  (local-unset-key (kbd "C-c SPC"))
  (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
  (local-set-key (kbd "<f10>") 'bcj/org-sort-entries)
  )
(add-hook 'org-mode-hook 'bcj/org-keys)

;; alchemist-mode, for elixir
(define-key alchemist-mode-map (kbd "C-c , a") 'alchemist-mix-test)
(define-key alchemist-mode-map (kbd "C-c , s") 'alchemist-mix-test-at-point)
(define-key alchemist-mode-map (kbd "C-c , m") 'alchemist-mix-test-this-buffer)







;; ---- GLOBAL UNSET KEYS
;;(global-set-key (kbd "<f12>") 'dwim-smartwin-visibility)
;; I keep hitting the 'menu' key when tring to open a terminal
(global-unset-key (kbd "<f10>"))

;; Too close to C-x b, ido-switch-buffer
;; this is normally bound to 'buffer-menu'
(global-unset-key (kbd "\C-x \C-b"))

;; I have yet to want to print from emacs...
(global-unset-key (kbd "s-p"))

;; unbind the standard send email keys, too close to my smex keybindings
(global-unset-key (kbd "\C-x m"))




;;----- MODIFICATIONS TO MODE KEYMAPS--------
(define-key rspec-compilation-mode-map "a" #'rspec-verify-all)
(define-key rspec-compilation-mode-map "f" #'rspec-run-last-failed)
(define-key rspec-compilation-mode-map "n" #'next-line)
(define-key rspec-compilation-mode-map "p" #'previous-line)

(define-prefix-command 'bcj/dired-rspec-map)
(define-key dired-mode-map "," 'bcj/dired-rspec-map)
(define-key bcj/dired-rspec-map "a" #'rspec-verify-all)




;; ---- CUSTOM KEY MAP GROUPS
;; (define-prefix-command 'bcj/toggle-map)
;; (define-key ctl-x-map "t" 'bcj/toggle-map)
;; (define-key bcj/toggle-map "c" #'column-number-mode)
;; (define-key bcj/toggle-map "r" #'rainbow-mode)
;; (define-key bcj/toggle-map "w" #'whitespace-mode)

;; --------- HYDRAS
(require 'hydra)

(global-set-key (kbd "C-c l")
		(defhydra hydra/launcher (:color pink :hint nil)
		  "
^Commands^ to launch modes & things
^^^^^^^^^^---------------------------
 _m_: magit-status
"
		  ("m" magit-status :exit t)
		  ("q" nil "cancel" :color blue)
		  ))

(global-set-key (kbd "C-c t")
		(defhydra hydra/toggler (:color pink :hint nil)
		  "
^Commands^ to toggle things, mostly minor modes
^^^^^^^^^^---------------------------
 _w_: whitespace-mode
 _t_: truncate-lines
 _c_: column-number-mode
 _r_: rainbow-mode
"
		  ("w" whitespace-mode :exit t)
		  ("t" toggle-truncate-lines :exit t)
		  ("c" column-number-mode :exit t)
		  ("r" rainbow-mode :exit t)

		  ("q" nil "cancel" :color blue)
		  ))




(provide 'z_keymaps)
;;; z_keymaps.el ends here
