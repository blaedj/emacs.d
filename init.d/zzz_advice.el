(require 'mydefuns )

(advice-add 'multi-term :around #'bcj-open-project-multiterm)
