;;some org mode defaults and settings

(setq org-log-done t)

(setq org-directory "~/Dropbox/org" )

(setq org-agenda-files (list "~/org/school.org"
                             "~/org/home.org"))

;; todo.org file, probably in dropbox if dropbox is installed
(setq org-default-notes-file (concat org-directory "/todo.org"))

;; other possibilities
;; ▼, ↴, ⬎, ⤷, and ⋱.
(setq org-ellipsis "↴")



(add-hook 'org-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (set-fill-column 80)))


(defun open-todo ()
  "Opens the todo.org file stored in dropbox, if presnet"
  (interactive)
  (if (file-exists-p org-default-notes-file)
      (find-file org-default-notes-file)
    ))

(push #'open-todo after-init-hook)


(setq org-todo-keyword-faces
      '(
	("IN-PROGRESS" . (:background "lime green"  :foreground "#002b36" :weight bold))
	("ON-HOLD" . (:background "#427"  :foreground "#ddd" :weight normal))
	))

(setq org-todo-keywords
      '(
	(sequence "TODO"
		  "IN-PROGRESS"
		  "DONE" )
	(sequence "ON-HOLD")
	))


(define-key org-mode-map (kbd "<f8>") 'org-todo)
