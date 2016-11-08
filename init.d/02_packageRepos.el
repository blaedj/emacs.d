(if (eq system-type 'darwin)
    (require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
  (require 'cask "~/.cask/cask.el") ;;expect cask to be installed in home dir when not on osx
  )

(cask-initialize)
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'pallet)
  (package-install 'pallet))

(require 'pallet)
(pallet-mode t)
;; (pallet-install) ;; NOTE: uncomment for first run of a fresh install or
;; upgrade

(provide '02_packageRepos)
;;; 02_packageRepos.el ends here
