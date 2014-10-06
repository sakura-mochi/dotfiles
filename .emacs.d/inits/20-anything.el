;
; 20-anything.el
; Emacs configuration file
; Version 1.1
;
; Created by Teppei Kobayashi
; Last Modified 2014/10/06
;


(require 'anything-config)
(require 'anything-git-files)

(setq anything-sources
	'(anything-c-source-buffers+
      (and (anything-git-files:git-p)
      	anything-git-files:modified-source
      	anything-git-files:all-source)
	  anything-c-source-recentf
	  anything-c-source-emacs-commands))
