(defun get-json (url)
  "retrieves the json from 'url'"
  (let ((buffer (url-retrieve-synchronously url))
        (json nil))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (setq json (buffer-substring-no-properties (point) (point-max)))
      (kill-buffer (current-buffer)))
    json))

(require 'json)
(defun get-and-parse-json (url)
  (let ((json-object-type 'plist))
    (json-read-from-string
     (get-json url))))

(defun postman-emacs-get-json (url)
  "prettifies a json string via json-mode"
  (interactive "sEnter url:")
  (let (jsondata)
    (setq jsondata (get-json url))
    (set-buffer (get-buffer-create (concat "**" url "**")))
    (insert jsondata)
    (json-mode)
    (json-mode-beautify (point-min) (point-max) t)
    ))


(defvar base-wfn-url
  "http://localhost:55949/managers/"
  "the base string for json urls for WFN")

(defun checkdates (url)
  (interactive "sEnter a url: ")
  (let (var1)
    (postman-emacs-get-json url)
;;    (delete-non-matching-lines "Date")
    (switch-to-buffer (concat "**" url "**"))
    ))

(defun checkdates-employees ()
  "DOCSTRING"
  (interactive)
  (checkdates (concat base-wfn-url "employees/getemployeedata"))
)
