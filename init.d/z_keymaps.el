(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x
(global-set-key (kbd "<menu>") 'smex)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

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

(add-hook 'ruby-mode-hook 'ruby_keys_outputing )
