;
; 20-tabbar.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/22
;


;; tabbar.el configuration
(require 'tabbar)

(tabbar-mode 1)
;; disable mouse
(tabbar-mwheel-mode -1)
;; disable group
(setq tabbar-buffer-groups-function nil)
;; disable left buttons
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
;; display buffer configuration
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; always show current buffer
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
		     ((equal "*scratch*" (buffer-name b)) b)		 ; show *scratch* buffer
		     ((char-equal ?* (aref (buffer-name b) 0)) nil)  ; hide other "*" buffer
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
;; appearance configuration
(set-face-attribute
	'tabbar-default nil
 	:family (face-attribute 'default :family)
 	:background (face-attribute 'mode-line-inactive :background)
 	:height 1.0)
(set-face-attribute
	'tabbar-unselected nil
	:background (face-attribute 'mode-line-inactive :background)
	:foreground (face-attribute 'mode-line-inactive :foreground)
	:box nil)
(set-face-attribute
	'tabbar-selected nil
    :background (face-attribute 'mode-line :background)
	:foreground (face-attribute 'mode-line :foreground)
    :box nil)

;; tab separator configuration
(setq tabbar-separator '(2.5))
