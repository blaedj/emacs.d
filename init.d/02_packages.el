;;Marmalade package repo for package.el
(unless  (boundp 'outdated)
  (require 'package)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  )
