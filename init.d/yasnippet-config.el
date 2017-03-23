;;; yasnippet-config -- configuration of yasnippet to my preference
;;; Commentary:
;;;
;;; Code:

(yas/global-mode 1)
(setq yas-installed-snippets-dir "~/.emacs.d/snippets/")
(require 'popup)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  "Display an isearch-able prompt for yasnippet choices, PROMPT CHOICES DISPLAY-FN."
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq  yas/prompt-functions
       '(yas/popup-isearch-prompt
	 yas/ido-prompt
	 yas/completing-prompt
	 yas/dropdown-prompt
	 yas-x-prompt
	 yas-no-prompt))

(provide 'yasnippet-config)
;;; yasnippet-config.el ends here
