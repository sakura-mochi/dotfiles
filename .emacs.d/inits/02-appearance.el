;
; 02-appearance.el
; Emacs configuration file
; Version 1.2
;
; Created by Teppei Kobayashi
; Last Modified 2014/05/01
;


;; color scheme (molokai)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)
(enable-theme 'molokai)

;; font configuration
(set-face-attribute 'default nil
					:family "Ricty"
					:height 135)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty"))

;; frame size
(set-frame-height (next-frame) 51)
(set-frame-width (next-frame) 211)

;; disable tool bar
(tool-bar-mode -1)

;; disable menu bar
(menu-bar-mode -1)

;; disable scroll bar
(set-scroll-bar-mode nil)

;; disable startup screen and message
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; enable parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
; correct
(set-face-background 'show-paren-match-face nil)
; error
(set-face-background 'show-paren-mismatch-face "maroon")
(set-face-foreground 'show-paren-mismatch-face "white")
