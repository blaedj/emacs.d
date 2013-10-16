
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 3))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))




(defun google-web-search ()
  "Search google for a user-specified query"
  (interactive)
  (browse-url
   (concat "http://www.google.com/#q="(read-from-minibuffer "Query:" ) ))
  )

(global-set-key (kbd "C-x g") 'google-web-search)

(defun formatBuf ()
  "formats the () and {}"
  (interactive)
  (while (search-forward-regexp "\)\[ \
]*\{" nil t)
    (replace-match ") {" nil t))
  )



(provide 'mydefuns)
