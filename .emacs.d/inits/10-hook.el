;
; 10-hook.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/22
;


;; Python
(add-hook 'python-mode-hook
    '(lambda ()
        (setq indent-tabs-mode nil)
        (setq indent-level 4)
        (setq python-indent 4)
        (setq tab-width 4)
        (define-key (current-local-map) "\C-h" 'python-backspace)))

;; YaTeX
(add-hook ' yatex-mode-hook 
	'(lambda ()
       (auto-fill-mode -1)))

;; C++
(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-symbols t)))
