;;; emacs-plugins --- Remove trailing whitespaces in current buffer.

;;; Commentary:
;; This module highlights and removes (if prompted) trailing whitespaces
;; in a buffer.

;;; Code:
(defun remove-trailing-whitespaces ( )
  "Highlight and remove trailing whitespaces in current buffer;
press space to remove and delete to skip."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while ( < (point) (point-max))
      (move-end-of-line 1)
      (let* ((end (point)) (begin end))
	;; (while ( = (buffer-substring begin (+ 1 begin)) " ")
	;;   (setq begin (- 1 begin)))
	(set-mark begin)
	(move-end-of-line 1)
	(if (y-or-n-p "Delete? ")
	    (progn
	      (delete-region (+ 1 begin) (+ 1 end))
	      )))
      (forward-line 1))))

(provide 'remove-trailing-whitespaces)
;;; remove-trailing-whitespaces.el ends here
