
(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;;(global-set-key (kbd "<tab>") 'hippie-expand  )
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "M-p") 'previous-multiframe-window )
(global-set-key (kbd "M-n") 'previous-multiframe-window )

(defun org-keys ()
  "Remap some org keybindings"
  (local-unset-key (kbd "C-c SPC"))
  (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
  )

(add-hook 'org-mode-hook 'org-keys)
