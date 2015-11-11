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
