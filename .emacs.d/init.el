;
; init.el
; Emacs configuration file
; Version 2.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/27
;


;; load path configuration
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/elisp/")
        (expand-file-name "~/.emacs.d/elisp/mode/")
        (expand-file-name "~/.emacs.d/elisp/mode/arduino-mode")
        (expand-file-name "~/.emacs.d/elisp/mode/yatex/")
        (expand-file-name "~/.emacs.d/elisp/auto-complete/")
        (expand-file-name "~/.emacs.d/elisp/auto-complete-latex/")
        (expand-file-name "~/.emacs.d/elisp/anything/")
         )
       load-path))


;; init-loader configuration
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
