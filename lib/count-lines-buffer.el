;;; emacs-plugins --- Print the number of lines in the buffer.

;;; Commentary:
;; This function prints the number of lines in the current buffer.

;;; Code:
(defun count-lines-buffer ( )
  "Count the number of lines in the current buffer;
print a message in the minibuffer with the result."
  (interactive)
  (let ((linecount 0))
    (save-excursion
      (goto-char (point-min))
      (while ( < (point) (point-max))
	(forward-line 1)
	(move-end-of-line 1)
	(setq linecount (+ 1 linecount)))
      (message "Buffer contains %d lines." linecount))))

(provide 'count-lines-buffer)
;;; count-lines-buffer.el ends here
