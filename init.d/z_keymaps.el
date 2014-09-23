(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x

;; unbind the standard send email keys, too close to my smex keybindings
(global-unset-key (kbd "\C-x m"))
(global-set-key (kbd "\C-x m") 'smex)     ; smarter M-x

(global-set-key (kbd "<menu>") 'smex)

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; mac switch meta key
(defun mac-switch-meta nil
  "switch meta between Option and Command"
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


;;(global-set-key (kbd "<tab>") 'hippie-expand  )
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-.") 'imenu-anywhere)

;; shortcuts for changing the font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-M-=") 'text-scale-decrease)

(global-set-key (kbd "C-x r p") 'replace-rectangle)

(global-set-key (kbd "M-n") 'smartscan-symbol-go-forward )
(global-set-key (kbd "M-p") 'smartscan-symbol-go-backward)


;; create a scratch buffer of arbitrary type
(global-set-key (kbd "C-c C-s b") 'create-scratch-buffer)

;;better ways to jump around to different windows:

;; https://github.com/abo-abo/ace-window
; still visual, less intrusive
(global-set-key (kbd "C-x o") 'ace-window)

;; https://github.com/dimitri/switch-window
; much more visual
;(global-set-key (kbd "C-x o") 'switch-window)


(defun org-keys ()
  "Remap some org keybindings"
  (local-unset-key (kbd "C-c SPC"))
  (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
  )
(add-hook 'org-mode-hook 'org-keys)

(defun ruby_keys_outputing  ()
  "Define the keybindings for seeing-is-believing"
(local-set-key (kbd "C-c C-o") 'seeing-is-believing )
)

(defun bcj-revert-buffer-no-confirm ()
  "Revert buffer with no confirmation"
  (interactive)
  (revert-buffer nil t))

(global-set-key (kbd "<f5>") 'bcj-revert-buffer-no-confirm)
(global-set-key (kbd "<f11>") 'multi-term)

;; I keep hitting the 'menu' hey when tring to open a terminal
(global-unset-key (kbd "<f10>"))

(add-hook 'ruby-mode-hook 'ruby_keys_outputing )
