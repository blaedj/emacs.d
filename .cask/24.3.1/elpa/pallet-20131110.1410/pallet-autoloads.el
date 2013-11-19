;;; pallet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (pallet-update pallet-install pallet-repack pallet-init)
;;;;;;  "pallet" "pallet.el" (21124 60312 39563 35000))
;;; Generated autoloads from pallet.el

(autoload 'pallet-init "pallet" "\
Bootstrap a Cask setup from package.el information.

\(fn)" t nil)

(autoload 'pallet-repack "pallet" "\
Recreate the Cask file from package.el information;
use `pt/package-archives-copy' if USE-COPY is true.

\(fn &optional USE-COPY)" nil nil)

(autoload 'pallet-install "pallet" "\
Install packages from the Cask file.

\(fn)" t nil)

(autoload 'pallet-update "pallet" "\
Update installed packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("pallet-pkg.el") (21124 60312 94700 288000))

;;;***

(provide 'pallet-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pallet-autoloads.el ends here
