(if (eq system-type 'darwin)
    (require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
  (require 'cask "~/.cask/cask.el") ;;expect cask to be installed in home dir when not on osx
  )

(cask-initialize)
(require 'package)

(unless (package-installed-p 'pallet)
  (package-install 'pallet))

(require 'pallet)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)
(pallet-mode t)
