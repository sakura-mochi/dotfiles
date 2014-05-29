;
; 20-google-translate.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/24
;


(require 'google-translate)

(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xy" 'google-translate-query-translate)

;; 翻訳のデフォルト値(日本語 -> 英語)
(custom-set-variables
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en"))
