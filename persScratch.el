111;;NOTES
ADD TO ADVANCED FILTERING SELECTION
- for some values, have a <= or >= the selected item.

(emacs-uptime) Wed Dec  4 10:56:50 2013
"14 days, 22 hours, 35 minutes, 40 seconds"


(global-set-key (kbd "C-c C-e") (hs-hide-block))
(global-set-key (kbd "C-c C-a") (hs-show-block))


;; (defun get-selection-or-unit (unit)
;;   "Return the string and boundary of text selection or UNIT under cursor.

;; If `region-active-p' is true, then the region is the unit.  Else,
;; it depends on the UNIT. See `unit-at-cursor' for detail about
;; UNIT.

;; Returns a vector [text a b], where text is the string and a and b
;; are its boundary.

;; Example usage:
;;  (setq bds (get-selection-or-unit 'line))
;;  (setq inputstr (elt bds 0) p1 (elt bds 1) p2 (elt bds 2)  )"
;;   (interactive)

;;   (let ((p1 (region-beginning)) (p2 (region-end)))
;;     (if (region-active-p)
;;         (vector (buffer-substring-no-properties p1 p2) p1 p2 )
;;       (unit-at-cursor unit) ) ) )

(require 'thingatpt)


(defun privitize ()
  "DOCSTRING"
  (interactive)
  (let (initString beginString finalString bds p1 p2 resultStr)
    (if (region-active-p)
        (setq bds (cons (region-beginning) (region-end) ))
      (setq bds (bounds-of-thing-at-point 'word)))
    (setq p1 (car bds) )
    (setq p2 (cdr bds) )
    (setq initString (thing-at-point 'word))
    (setq beginString (substring initString 0 1))
    (setq finalString (substring initString 1 nil))
    (setq beginString (concat "_" (downcase beginString)))
    (setq resultStr (concat beginString finalString))
    (delete-region p1 p2 ) 
    (insert resultStr)))


(defun highlight-current-defun ()
  "DOCSTRING"
  (interactive)
  (let (p1 p2)
    (narrow-to-defun)
    ;;(kill-ring-save (point-max) (point-min))
    (goto-char (point-min))
    (push-mark-command (point))
    (goto-char (point-max))
    (setq deactivate-mark nil)
    (widen)
    ))

(defun highlight-current-defun ()
  "Just use C-M-h instead, found this once I had finished writing this function."
  (interactive)
  (let (p1 p2)
    (narrow-to-defun)
    ;;(kill-ring-save (point-max) (point-min))
    (goto-char (point-min))
    (push-mark-command (point))
    (goto-char (point-max))
    (setq deactivate-mark nil)
    (widen)
    ))

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

(get-json "http://localhost:55949/managers/employees/getemployeedata")

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



(require 'ac-js2)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

C:\Program Files (x86)\RSA SecurID Token Common;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;C:\Program Files\Symantec.cloud\PlatformAgent\;c:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\;c:\Program Files\Microsoft SQL Server\100\Tools\Binn\;c:\Program Files\Microsoft SQL Server\100\DTS\Binn\;c:\Program Files (x86)\Microsoft ASP.NET\ASP.NET Web Pages\v1.0\;C:\Program Files\Microsoft SQL Server\110\Tools\Binn\;c:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\;c:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\;c:\Program Files (x86)\Microsoft SQL Server\110\DTS\Binn\;C:\Program Files (x86)\Windows Kits\8.0\Windows Performance Toolkit\;C:\Program Files (x86)\QuickTime\QTSystem\;C:\Program Files\Calibre2\;C:\Program Files\TortoiseSVN\bin;C:\Program Files\Microsoft\Web Platform Installer\;C:\Program Files\nodejs\;%systemroot%\System32\WindowsPowerShell\v1.0\;

C:\Chocolatey\bin;C:\Program Files (x86)\Git\cmd;C:\Users\bjohnsto\AppData\Roaming\scriptcs;C:\tools\gittfs;C:\Users\bjohnsto\AppData\Roaming\npm;C:\Windows\Microsoft.NET\Framework\v4.0.30319\

('skewer-flash-region)
(/ 147 2)
73

144










