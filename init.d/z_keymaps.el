
(global-set-key "\C-x\C-m" 'smex)     ; smarter M-x

;; unbind the standard send email keys, too close to my smex keybindings
(global-unset-key (kbd "\C-x m"))
(global-set-key (kbd "\C-x m") 'smex)     ; smarter M-x

;; I have yet to want to print from emacs...
(global-unset-key (kbd "s-p"))

(global-set-key (kbd "<menu>") 'smex)

(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-w" 'backward-kill-word)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "M-l") 'er/expand-region)
(global-set-key (kbd "M-L") 'er/contract-region)

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
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
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
;; (global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x i") 'ace-window)
(global-set-key (kbd "C-x o") 'other-window)

;; https://github.com/dimitri/switch-window
; much more visual
;(global-set-key (kbd "C-x o") 'switch-window)


(defun org-keys ()
  "Remap some org keybindings"
  (local-unset-key (kbd "C-c SPC"))
  (local-set-key (kbd "C-c SPC") 'ace-jump-mode)
  )
(add-hook 'org-mode-hook 'org-keys)

(require 'mydefuns ) ;; so we can move these defuns out of the keymap file...
;;(dwim-smartwin-visibility)


(global-set-key (kbd "<f5>") 'bcj-revert-buffer-no-confirm)
(global-set-key (kbd "<f8>") 'sp-switch-space)
(global-set-key (kbd "<f12>") 'dwim-smartwin-visibility)
;; I keep hitting the 'menu' key when tring to open a terminal
(global-unset-key (kbd "<f10>"))

;; I never use the buffer menu, but I accidentally open it enough
;; to go through the effort to remove the keybind for it.
;; this is normally bound to 'buffer-menu'
(global-unset-key (kbd "\C-x \C-b"))


;; make zap-to-char not delete the char provided
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
  you are deleting forward, the CHAR is replaced and the point is
  put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))

(provide 'z_keymaps)
;;; z_keymaps.el ends here
