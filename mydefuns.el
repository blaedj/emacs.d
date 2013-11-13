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

(defun makeEFProps name
  (concat
   ('("this.Property(t => t.")(name)(").IsOptional()") )
   )
  )

(defun formatjs ()
  "Formats the () and {} in a js file."
  (interactive)
  (push-mark)
  (while (search-forward "){" nil t)
    (replace-match ") {" nil t))
  (pop-mark)
)

(setq persistent-scratch-file-name "~/.emacs.d/persScratch.el")
(defun save-persistent-scratch ()
  "Write the contents of scratch to the file name `persistent-scratch-file-name'."
  (with-current-buffer (get-buffer-create "*scratch*") (write-region (point-min)
 (point-max) persistent-scratch-file-name)))

(defun load-persistent-scratch ()
  "Load the contents of `persistent-scratch-file-name' into the scratch buffer, clearing its contents first."
  (if (file-exists-p persistent-scratch-file-name)
      (with-current-buffer
          (get-buffer "*scratch*") (delete-region (point-min) (point-max))
          (insert-file-contents persistent-scratch-file-name))))
(push #'load-persistent-scratch after-init-hook)
(push #'save-persistent-scratch kill-emacs-hook)



(provide 'mydefuns)
