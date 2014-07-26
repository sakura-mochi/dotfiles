;
; 20-moccur-config.el
; Emacs configuration file
; Version 1.3
;
; Created by Teppei Kobayashi
; Last Modified 2014/07/26
;

(require 'color-moccur)

(load "moccur-edit")
(setq moccur-split-word t)

; when emacs find command "migemo", moccor can use migemo
(when (executable-find "cmigemo")
  (setq moccur-use-migemo t))
