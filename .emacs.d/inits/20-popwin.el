;
; 20-popwin.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/24
;


(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

; show popup window at bottom
(setq popwin:popup-window-position 'bottom)

; Compile
(push '("*compilation*") popwin:special-display-config)
