;;; zzz_advice --- some advisements.
;;; Commentary:
;;; Code:
(require 'mydefuns )

(advice-add 'multi-term :around #'bcj-open-project-multiterm)
(advice-add 'ido-common-initialization :after #'bcj-ido-keys)
(provide 'zzz_advice)
;;; zzz_advice.el ends here
