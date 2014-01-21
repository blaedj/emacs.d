(require 'yasnippet)

(defvar yas-candidates nil)

(defun init-yas-candidates ()
	(let ((table (yas/get-snippet-tables major-mode)))
		(if table
		  (let (candidates (list))
				(mapcar (lambda (mode)          
				  (maphash (lambda (key value)    
					(push key candidates))          
				  (yas/table-hash mode))) 
				table)				
			(setq yas-candidates candidates)))))
			
			
(defvar ac-new-yas-source
	'(	(init . init-yas-candidates)
		(candidates . yas-candidates)
		(action . yas/expand)
		(symbol . "a")))

(provide 'my-yas-funs)
