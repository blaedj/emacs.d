;;; zzz_advice --- some advisements.
;;; Commentary:
;;; Code:

(require 'mydefuns )

(advice-add 'ansi-term :around #'bcj-open-project-term)

(provide 'zzz_advice)
;;; zzz_advice.el ends here
