;;emacs can't find ispell on OSX for some reason
;; probably because the default homebrew install location
;; isn't on the exec-path by default
(if (eq system-type 'darwin) ((lambda ()
			      (setq ispell-program-name "/usr/local/bin/ispell")
			      ;; add homebrew (/usr/local/bin) to the exec path
					;(setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
			      (push "/opt/local/bin" exec-path)
			      ;; it's possible that the exec-path-from-shell could
			      ;; make the code above unneeded
			      (exec-path-from-shell-initialize);set the $MANPATH, $PATH and exec-path from the shell

			      ;; set keys for Apple keyboard, for emacs in OS X
			      (setq mac-command-modifier 'meta) ; make cmd key do Meta
			      (setq mac-option-modifier 'super) ; make cmd key do Meta
			      ;;(setq mac-command-modifier 'super) ; make cmd key do super
			      ;;(global-unset-key (kbd "s-l") )
			      )))

;; Xiki
;; Load el4r, which loads Xiki
;;(add-to-list 'load-path "/Users/blaed/.rvm/gems/ruby-2.0.0-p451/gems/trogdoro-el4r-1.0.10/data/emacs/site-lisp/")
;;(require 'el4r)
;;(el4r-boot)
;;(el4r-troubleshooting-keys)
