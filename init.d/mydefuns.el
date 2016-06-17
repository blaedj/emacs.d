;;; mydefuns.el --- some miscellaneous functions I use.

;;; Commentary:
;; unless noted, I wrote/heavily modified these.


;;; Code:

;; the following two defuns are modified from: http://whattheemacsd.com/setup-dired.el-02.html
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 2))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)


;; from seeing-is-believing: https://github.com/JoshCheek/seeing_is_believing
(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))


;; if we include a space in the url that we pass to browse-url, it seems to trigger an automatic http-encoding of the entire string.
;; (not sure if this happens in browse-url or elsewhere)
;; this breaks the url, possibly because google expects '#?=' and not '%23?=' in the query string.
;; so we handle this by pre-encoding spaces and ?'s. This seems to fix the issue.
(defun google-web-search ()
  "Search google for a user-specified query"
  (interactive)
  (browse-url
   (concat "http://www.google.com/#q=" (bcj-http-encode (read-from-minibuffer "Query: "))))
  )

(defun bcj-http-encode (string-to-encode)
  (replace-regexp-in-string
   "?" "%3F"
   (replace-regexp-in-string " " "%20" string-to-encode))
  )

(global-set-key (kbd "C-x g") 'google-web-search)

;;inspired by helm-dash, if you aren't on OS X, http://devdocs.io is a decent browser-based alternative to Dash. (http://kapeli.com/dash)
(defun devdocs-search ()
  "Search documentation on devDocs.io"
  (interactive)
  (let (whichdocs)
    (setq whichdocs (read-from-minibuffer "Which Documentation? "))
    (browse-url
     (concat
      (concat "http://devdocs.io/" whichdocs "/" )
      (read-from-minibuffer "Query: ")))))


;; custom defun to properly format the spacing around braces and parens
(defun formatBuf ()
  "formats the () and {}"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (search-forward-regexp "\)\[ \
]*\{" nil t)
      (replace-match ") {" nil t)))
  )

;;; from reddit.com/r/emacs/comments/1pkld4/elisp_question_what_does_foo_mean/
(setq persistent-scratch-file-name "~/.emacs.d/persScratch.el")

(defun save-persistent-scratch ()
  "Write the contents of scratch to the file name `persistent-scratch-file-name'."
  (interactive)
  (with-current-buffer (get-buffer-create "*scratch*") (write-region (point-min)
								     (point-max) persistent-scratch-file-name)))

(defun load-persistent-scratch ()
  "Load the contents of `persistent-scratch-file-name' into the scratch buffer, clearing its contents first."
  (interactive)
  (if (file-exists-p persistent-scratch-file-name)
      (with-current-buffer
	  (get-buffer "*scratch*") (delete-region (point-min) (point-max))
	  (insert-file-contents persistent-scratch-file-name))))

(push #'load-persistent-scratch after-init-hook)
(push #'save-persistent-scratch kill-emacs-hook)


(defun create-scratch-buffer ()
  "creates a scratch buffer of specified type"
  (interactive)
  (let (newbuffer mode-type)
    (setq mode-type (read-from-minibuffer "scratch mode: "))
    (setq newbuffer (get-buffer-create (concat mode-type "-scratch")))
    (switch-to-buffer newbuffer)
    (funcall (intern (concat mode-type "-mode")))))


;;show the ouptut of runnin coffee on the current file since I can't get flymake
;; to work properly
(defun show-coffeelint ()
  "show output of coffeelint on current file"
  (interactive)
  (let (filename output-buffer)
    (setq filename (buffer-file-name (current-buffer)))
    (setq output-buffer (get-buffer-create (concat "* Coffeelint" filename)))
    ;;(with-output-to-temp-buffer output-buffer (shell-command (concat "coffeelint " filename)))
    (shell-command (concat "coffee " filename) output-buffer output-buffer)
    )
  )

(defun bcj-open-project-multiterm (orig-fun &rest args)
  "Changes the name of the multi-term buffer if in a projectile project. If we are in a project,
the name of the terminal buffer will be 'terminal-PROJECTNAME'"
  (let ((new-term-buffer (apply orig-fun args)))
    (let (new-name )
      (if (projectile-project-p)
	  (setq new-name
		(concat "terminal-" (upcase (projectile-project-name))))
	(setq new-name (buffer-name new-term-buffer))
	)
      (rename-buffer new-name)
      )))

(defun bcj-revert-buffer-no-confirm ()
  "Revert buffer with no confirmation"
  (interactive)
  (revert-buffer nil t))

(defun dwim-smartwin-visibility ()
  "toggle smartwin window, if not visible makes the window visible and switches to it."
  (interactive)
  (let (smartwin-is-visible)

    (setq smartwin-is-visible (smartwin--get-smart-window))
    (if smartwin-is-visible
	(smartwin-hide)
      (smartwin-show)
      (switch-to-buffer (window-buffer (smartwin--get-smart-window)))
      )))

(provide 'mydefuns)
