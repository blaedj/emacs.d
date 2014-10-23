(require 'cask "~/.cask/cask.el")
(cask-initialize)

(unless (package-installed-p 'pallet)
  (package-install 'pallet))
(require 'pallet)

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)
