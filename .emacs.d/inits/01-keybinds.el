;
; 01-keybinds.el
; Emacs configuration file
; Version 1.2
;
; Created by Teppei Kobayashi
; Last Modified 2013/12/31
;


;; C-m : return + indent
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; C-h : backspace
(keyboard-translate ?\C-h ?\C-?)

;; C-t : change focus window
(define-key global-map (kbd "C-t") 'other-window)

;; C-c l : change truncate lines
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; C-i : insert Tab
(global-set-key "\C-i" '(lambda ()
                          (interactive)
                          (insert "\t")))

;; C-c C-t : wait shell command
(global-set-key (kbd "C-c C-t") 'shell-command)

;; C-; : launch Anything
(define-key global-map (kbd "C-;") 'anything)

;; C-c C-r: moccur in buffer
(define-key global-map (kbd "C-c C-r") 'moccur)

;; C-r : anything-c-moccur
(global-set-key (kbd "C-r") 'anything-c-moccur-occur-by-moccur)

;; M-y : show Anything kill-ring
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

;; C-z : disable minimize
(global-unset-key "\C-z")

;; M-i : indent region
(global-set-key "\M-i" 'indent-region)
