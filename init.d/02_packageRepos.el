;;(require 'cask "~/.cask/cask.el")
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)

(unless (package-installed-p 'pallet)
  (package-install 'pallet))
(require 'pallet)

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
(pallet-mode t)
