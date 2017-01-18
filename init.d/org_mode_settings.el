;;; org_mode_settings.el --- Org mode defaults and settings
;;; Commentary:

;;; Code:

(setq org-log-done t)

(setq org-directory "~/Dropbox/org" )

(setq org-agenda-files (list (concat org-directory "/todo.org")))

;; todo.org file, probably in dropbox if dropbox is installed
(setq org-default-notes-file (concat org-directory "/todo.org"))

;; other possibilities
;; ▼, ↴, ⬎, ⤷, and ⋱.
(setq org-ellipsis "↴")

;; show prettier bullet points instead of asterisks
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode 1)))


(setq org-return-follows-link t)

(add-hook 'org-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (set-fill-column 80)))


(defun open-todo ()
  "Opens the todo.org file stored in dropbox, if present."
  (interactive)
  (if (file-exists-p org-default-notes-file)
      (find-file org-default-notes-file)
    ))

(push #'open-todo after-init-hook)

(setq org-todo-keywords
      '(
	(sequence "TODO"
		  "IN-PROGRESS"
		  "DONE" )
	(sequence "ON-HOLD")
	))


(define-key org-mode-map (kbd "<f8>") 'org-todo)
(define-key org-mode-map (kbd "<f7>") 'org-schedule)

;; custom org-agenda commands
(setq org-agenda-custom-commands
'(("b" "Agenda and In-progress todos" ((todo "IN-PROGRESS") (tags-todo "next") (agenda "")))))


(provide 'org_mode_settings)
;;; org_mode_settings.el ends here
