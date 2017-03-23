(setq user-mail-address "blaedj@gmail.com")
(add-to-list 'Info-default-directory-list "/usr/share/info/emacs-24")
(add-hook 'Info-mode-hook		; After Info-mode has started
	  (lambda ()
    	    (setq Info-additional-directory-list Info-default-directory-list)
	    ))
(provide 'bcj_User_Information)
;;; bcj_User_Information.el ends here
