
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

(defun devdocs-search ()
  "Search documentation on devDocs.io"
  (interactive)
  (let (whichdocs)
    (setq whichdocs (read-from-minibuffer "Which Documentation?"))
  (browse-url
   (concat
    (concat "http://devdocs.io/#q=" whichdocs " " )
    (read-from-minibuffer "Query:")))))

(global-set-key (kbd "C-c d") 'devdocs-search)

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

(provide 'mydefuns)
