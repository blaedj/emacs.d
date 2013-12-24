
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

(defun formatBuf ()
  "formats the () and {} styles in the buffer"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (search-forward-regexp "\)\[ \
]*\{" nil t)
      (replace-match ") {" nil t))))

(setq persistent-scratch-file-name "~/.emacs.d/persScratch.el")
(defun save-persistent-scratch ()
  "Write the contents of scratch to the file name `persistent-scratch-file-name'."
  (interactive)
  (with-current-buffer (get-buffer-create "*scratch*")
    (write-region (point-min)
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

(defun privitize ()
  "turns the word/variable name at point
   into an 'underscored' one for c# "
  (interactive)
  (let (initString finalString bds p1 p2 resultStr)
    (if (region-active-p)
        (setq bds (cons (region-beginning) (region-end) ))
      (setq bds (bounds-of-thing-at-point 'word)))
    (setq p1 (car bds) )
    (setq p2 (cdr bds) )
    (setq initString (thing-at-point 'word))
    (setq finalString (substring initString 1 nil))
    (setq resultStr (concat
                     "_" (downcase (substring initString 0 1))) finalString)
    (delete-region p1 p2)
    (insert resultStr)))
(provide 'mydefuns)
