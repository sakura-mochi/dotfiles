;
; 20-undo-tree.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/11/22
;


;; undo-tree.el configuration
(require 'undo-tree)
;; auto start undo-tree
(global-undo-tree-mode t)
;; key configuration
(global-set-key (kbd "M-/") 'undo-tree-redo)
