;;; zzz_advice --- some advisements.
;;; Commentary:
;;; Code:

(require 'mydefuns )

;; TODO: need to fix this to handle the case when the buffer name already
;; exists; currently it throws an error and causes my window setup funciton to
;; terminate early.
;;(advice-add 'ansi-term :around #'bcj-open-project-term)

(provide 'zzz_advice)
;;; zzz_advice.el ends here
