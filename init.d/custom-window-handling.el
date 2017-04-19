;;; custom-window-handling -- configuration for opening, moving windows.
;;; Commentary:
;;;
;;; Code:

;; (setq bcj/temp-window (nth 3 (window-list)))

(defun bcj/special-display (buffer &optional alist)
  "Switch the 'special' window to display BUFFER, with optional ALIST.
Returns  visible window if there are three visible windows, nil otherwise.
Minibuffer is ignored."
  (let ((window (window-at 1 1)))
    (set-window-buffer window buffer)
    window))


(customize-set-variable
 'display-buffer-alist
 '(
   ("^\\*Completions\\*"	  bcj/special-display)
   ("^\\*Help\\*"		  bcj/special-display)
   ("^\\*grep\\*"		  bcj/special-display)
   ("^\\*ag.*\\*"		  bcj/special-display)
   ("^\\*ag search.*\\*"          bcj/special-display)
   ("^\\*Apropos\\*"		  bcj/special-display)
   ("^\\*Compile\\*"		  bcj/special-display)
   ("^\\*Occur\\*"		  bcj/special-display)
   ("^\\*Shell Command Output\\*" bcj/special-display)
   ("^\\*Async Shell Command\\*"  bcj/special-display)
   ))

(provide 'custom-window-handling)
;;; custom-window-handling.el ends here
