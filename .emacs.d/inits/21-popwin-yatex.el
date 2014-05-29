;
; 21-popwin-yatex.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/24
;


(require 'yatex)

(defadvice YaTeX-showup-buffer (around popwin-yatex:YaTeX-showup-buffer (buffer &optional func select) activate)
  (popwin:display-buffer-1 buffer
                           :default-config-keywords `(:noselect ,(not select))
                           :if-config-not-found (lambda (buffer) ad-do-it)))

(provide 'popwin-yatex)

(require 'popwin-yatex)

;; show YaTeX popup display with popwin
(push '("*YaTeX-typesetting*") popwin:special-display-config)
(push '("*dvi-printing*") popwin:special-display-config)
