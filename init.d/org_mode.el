;;some org mode defaults and settings

(setq org-log-done t)

(setq org-agenda-files (list "~/org/school.org"
                             "~/org/home.org"))

(add-hook 'org-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (set-fill-column 80)))
