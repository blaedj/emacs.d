
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(unless  (boundp 'outdated)
  (require 'package)
;;Marmalade package repo for package.el
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)

  )
