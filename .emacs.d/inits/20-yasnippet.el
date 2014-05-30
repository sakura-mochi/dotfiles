;
; 20-yasnippet.el
; Emacs configuration file
; Version 1.0
;
; Created by Teppei Kobayashi
; Last Modified 2013/12/06
;


(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"
        ))

(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))

;; insert snippet
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; make new snippet
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; show or edit snippet
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; anything interface
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (anything-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*anything yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))

(setf (symbol-function 'yas-active-keys)
      (lambda ()
        (remove-duplicates (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))
