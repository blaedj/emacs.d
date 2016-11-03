;;; zzz_advice --- some advisements.
;;; Commentary:
;;; Code:
(require 'mydefuns )

(advice-add 'multi-term :around #'bcj-open-project-multiterm)

(provide 'zzz_advice)
;;; zzz_advice.el ends here
