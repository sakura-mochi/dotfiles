;
; 20-auto-complete.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/12/26
;


;; auto-complete configuration
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
(ac-config-default)

;; auto start auto-complete
(global-auto-complete-mode t)

;; key configuration
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; useful configuration
(setq ac-dwim t)

;; appoint file
;; ac-source-filename                   : from filename
;; ac-source-words-in-same-mode-buffers : from same major mode
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
;; start trigger : auto
(setq ac-auto-start 3)
;; start trigger : Tab
(ac-set-trigger-key "TAB")

;; auto-complete-latex configuration
(require 'auto-complete-latex)
(setq ac-l-dict-directory "~/.emacs.d/elisp/auto-complete-latex/ac-l-dict/")
(add-to-list 'ac-modes 'latex-mode)
(add-hook 'latex-mode-hook 'ac-l-setup)
;; auto start in YaTeX mode
(when (require 'auto-complete-latex nil t)
  (setq ac-l-dict-directory "~/.emacs.d/elisp/auto-complete-latex/ac-l-dict/")
  (add-to-list 'ac-modes 'yatex-mode)
  (add-hook 'yatex-mode-hook 'ac-l-setup))

;; history file
(setq ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat")
