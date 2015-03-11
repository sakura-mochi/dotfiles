;
; linux-config.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2014/06/29
;


;; character code configuration
(require 'ucs-normalize)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; enable mozc
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)

;; keyboard setting
(global-set-key
 [henkan]
 (lambda () (interactive)
   (when (null current-input-method) (toggle-input-method))))

(global-set-key
 [muhenkan]
 (lambda () (interactive)
   (inactivate-input-method)))
(defadvice mozc-handle-event (around intercept-keys (event))
  "Intercept keys muhenkan and zenkaku-hankaku, before passing keys to mozc-server (which the function mozc-handle-event does), to properly disable mozc-mode."
  (if (member event (list 'zenkaku-hankaku 'muhenkan))
      (progn (mozc-clean-up-session)
             (toggle-input-method))
    (progn ad-do-it)))

(ad-activate 'mozc-handle-event)
