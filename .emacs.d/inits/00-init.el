;
; 00-init.el
; Emacs configuration file
; Version 1.3
;
; Created by Teppei Kobayashi
; Last Modified 2014/05/26
;


;; share path with last launched shell
(load-file (expand-file-name "~/.emacs.d/cache/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; enable common lisp
(require 'cl)

;; enable emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; start home directory
(cd "~")

;; set language (Japanese)
;; (set-language-environment 'Japanese)

;; disable completion case (serach)
(setq completion-ignore-case t)

;; disable completion case (file,directory name)
(setq read-file-name-completion-ignore-case t)

;; disable completion case (buffer name)
(setq read-buffer-completion-ignore-case t)

;; if changed using buffer, reload it
(global-auto-revert-mode 1)

;; if exist the same name directory and file, tell them apart
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Tab configuration
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))

; disable Tab
(setq-default indent-tabs-mode nil)

; disable backup file
(setq make-backup-files nil)
; disable auto save file
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; scrool 1 line
(setq scroll-step 1)

;; set mini-buffer history length to infinity
(setq history-length t)

;; set undo no redo
(setq undo-no-redo t)

;; set undo limit
(setq undo-limit 10000)
(setq undo-strong-limit 50000)
