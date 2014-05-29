;
; 20-recentf.el
; Emacs configuration file
; Version 1.1
;
; Created by Teppei Kobayashi
; Last Modified 2013/12/31
;


(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))
