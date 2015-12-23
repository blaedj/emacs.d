;;some org mode defaults and settings

(setq org-log-done t)

(setq org-agenda-files (list "~/org/school.org"
                             "~/org/home.org"))
;; other possibilities
;; ▼, ↴, ⬎, ⤷, and ⋱.
(setq org-ellipsis "↴")



(add-hook 'org-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (set-fill-column 80)))

;; todo.org file, probably in dropbox if dropbox is installed
(setq todo-org-file-name "~/Dropbox/todo.org")
(defun open-todo ()
  "Opens the todo.org file stored in dropbox, if presnet"
  (interactive)
  (if (file-exists-p todo-org-file-name)
      (find-file todo-org-file-name)
      ))

(push #'open-todo after-init-hook)
