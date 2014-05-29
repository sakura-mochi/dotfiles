;
; 20-anything.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/27
;


(require 'anything-config)
(setq anything-sources
	'(anything-c-source-buffers+
      anything-c-source-recentf
	  anything-c-source-emacs-commands))
