;;c-mode settings
(add-hook 'c-mode-common-hook
	  '(lambda ()
;; RET キーで自動改行+インデント
(define-key c-mode-base-map "\C-m" 'newline-and-indent)))
(c-add-style "k&r2"
	     '("k&r"
	       (c-basic-offset . 4)))
(setq c-default-style
      '((c-mode . "k&r2")
	(java-mode . "java")
	(other . "gnu")))
(add-hook 'c-mode-hook
	  (lambda ()
	    (define-key c-mode-base-map "\C-cc" 'compile)
	    (define-key c-mode-base-map "\C-ce" 'next-error)
	    (define-key c-mode-base-map "\C-cd" 'gdb)))
(add-hook 'c-mode-hook
	  (lambda ()
	    (c-toggle-hungry-state 1)))
(setq gdb-many-windows t)
(add-to-list 'auto-mode-alist '("\\.cu$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c-mode))
