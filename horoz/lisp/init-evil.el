(when (maybe-require-package 'evil)
  (maybe-require-package 'ibuffer-projectile)

  (evil-mode 1)
  (evil-define-command evil-escape-f ()
    :repeat change
    (interactive)
    (let ((modified (buffer-modified-p)))
      (insert "j")
      (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
			     nil 0.5)))
	(cond
	 ((null evt) (message ""))
	 ((and (integerp evt) (char-equal evt ?j))
	  (delete-char -1)
	  (set-buffer-modified-p modified)
	  (push 'escape unread-command-events))
	 (t (setq unread-command-events (append unread-command-events
						(list evt))))))))

  (define-key evil-insert-state-map "j" #'evil-escape-f))

(provide 'init-evil)
