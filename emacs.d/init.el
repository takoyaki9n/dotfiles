;;M-x load-file

;;general settings
;;列番号表示
(column-number-mode t)
;;クリップボードを共有
(setq x-select-enable-clipboard t)
;;カッコ表示
(show-paren-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(read-file-name-completion-ignore-case t)
 '(show-paren-mode t))
;;バックアップファイル
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
;; 選択範囲削除
(delete-selection-mode t)
;; 最近使ったファイル
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; (setq desktop-files-not-to-save "\\(^/[^/:]*:\\|\\.diary$\\)")
;; (autoload 'desktop-save "desktop" nil t)
;; (autoload 'desktop-clear "desktop" nil t)
;; (autoload 'desktop-load-default "desktop" nil t)
;; (autoload 'desktop-remove "desktop" nil t)
;; (desktop-read)
;; (add-hook 'kill-emacs-hook 'desktop-save-in-desktop-dir)

;; 分割された設定ファイルのPATH
(setq load-path
      (append '(
                "~/.emacs.d/conf"
                ) load-path))

(load "scheme.el")

(load "c.el")




;; spell check
;;Aspell
(add-to-list 'exec-path "/usr/bin/aspell")
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(latex-mode-hook))


