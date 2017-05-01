(if (eq system-type 'darwin)
    (progn
      ;; find installed cask version, if any.
      ;; will blow up if cask isn't installed.
      (let ((installed-cask-version (replace-regexp-in-string "\n" "" (shell-command-to-string "/usr/local/bin/cask --version"))))
	(require 'cask   (concat
			  "/usr/local/Cellar/cask/" installed-cask-version "/cask.el")))
      )
  ;;expect cask to be installed in home dir when not on osx
  (require 'cask "~/.cask/cask.el"))

(cask-initialize)
(require 'package)

(setq package-archives '(
			 ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ))

(package-initialize)

(unless (package-installed-p 'pallet)
  (package-install 'pallet))

(require 'pallet)
(pallet-mode t)
;; (pallet-install) ;; NOTE: uncomment for first run of a fresh install or
;; upgrade

(provide '02_packageRepos)
;;; 02_packageRepos.el ends here
