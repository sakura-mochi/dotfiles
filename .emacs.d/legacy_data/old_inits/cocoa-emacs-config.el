;
; cocoa-emacs-config.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2014/02/20
;


;; change option and command
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; character code configuration
(require 'ucs-normalize)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
