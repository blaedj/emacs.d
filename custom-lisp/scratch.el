;;; Scratch -- a real persistent scratchpad for elisp hacking
;;; Commentary:
;;; Code:

(defun bcj-popup (title msg &optional icon sound timeout)
  "Show an OS popup on supported systems, or echo.
TITLE is the title of the message, MSG is the context.
Optionally you can provide an ICON and a SOUND to be played.
These should absolute paths to icon and sound files.  TIMEOUT is
how long to keep the popup around for in seconds."
  (interactive)
  (when sound ()) ;; TODO: Implement
  (start-process-shell-command "notification-popup" "*Messages*"
		 (concat "terminal-notifier"
			 (if timeout (concat " -timeout " timeout ))
			 (if icon    (concat " -appIcon " icon    ))
			 (concat " -message \"" msg "\"")
			 (concat " -title \"" title "\"")
			 )))

(bcj-popup "hello world" "all of you" nil nil "5")

(setq
 appt-message-warning-time 15
 appt-desplay-mode-line t
 app-display-format 'window)

;; TODO: the below kinda works, but we still have to rebuild the agenda buffer
;; manually for the events to be added to the the appt list. Either need to add
;; an after-file-save hook or else automatically rebuild the agenda buffer when
;; saving our todo.org file.
(add-hook 'org-finalize-agenda-hook (lambda ()
				      "erase and rebuild appts."
				      (setq appt-time-msg-list nil)
				      (org-agenda-to-appt)))


(defun bcj-appt-display (minutes-to-appt new-time msg)
  "This is the doc string.  MINUTES-TO-APPT NEW-TIME MSG."
  (bcj-popup (format "Appointment in %s minute(s)" minutes-to-appt) msg nil nil "43200"))

(defun bcj-appt-window-delete ()
  "This is a no-op for now.
Could customize it to kill the terminal-notifier
command or close the 'async-shell' buffer"
  )

(setq appt-disp-window-function (function bcj-appt-display))

(setq appt-delete-window-function (function bcj-appt-window-delete))

(provide 'scratch)
;;; scratch.el ends here
