
(setq post401k .94 )
(setq healthIns 795)
(setq hrsBiweekly 76 )
(setq afterWithholding .73 )

(setq Monthly-Takehome-Income (* 2 ( * afterWithholding ( - (* post401k (* hrsBiweekly 39)) 795))))

(print Monthly-Takehome-Income)
