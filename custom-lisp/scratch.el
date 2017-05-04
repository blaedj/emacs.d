;;; Scratch -- a real persistent scratchpad for elisp hacking
;;; Commentary:
;;; Code:

(defvar bcj/org-mobile-sync-timer nil "Timer to sync org files to dropbox.")
(defvar bcj/org-mobile-sync-seconds (* 60 10) "Interval to sync org files on.")
(defun bcj/org-mobile-sync ()
  "Sync org files to mobile staging area for mobile viewing."
  (message "Updating org-mobile files..." )
  (org-mobile-push))

(bcj/org-mobile-sync)
(defun bcj/start-org-mobile-sync ()
  "Start automatic org-mobile-push."
  (interactive)
  (setq bcj/org-mobile-sync-timer (run-with-idle-timer
				   bcj/org-mobile-sync-seconds
				   t 'bcj/org-mobile-sync)))

(defun bcj/stop-org-mobile-sync ()
    "Stop automatic org-mobile-push."
  (interactive)
  (cancel-timer bcj/org-mobile-sync-timer))

(defun bcj/start-or-end-kmacro ()
    "Start recording a macro, or end the macro if currently recording."
  (interactive)
  (if defining-kbd-macro
      (kmacro-end-macro)
    (kmacro-start-macro)))

(provide 'scratch)
;;; scratch.el ends here
