;;emacs can't find ispell on OSX for some reason
(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/ispell")
  ;; add homebrew (/usr/local/bin) to the exec path
  ;(setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  )



;; Xiki
;; Load el4r, which loads Xiki
;;(add-to-list 'load-path "/Users/blaed/.rvm/gems/ruby-2.0.0-p451/gems/trogdoro-el4r-1.0.10/data/emacs/site-lisp/")
;;(require 'el4r)
;;(el4r-boot)
;;(el4r-troubleshooting-keys)
()
