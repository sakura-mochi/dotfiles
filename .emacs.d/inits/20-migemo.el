;
; 20-migemo.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2014/07/26
;

(when (executable-find "cmigemo")
  (require 'migemo nil t)
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init))
