;;; emacs-plugins --- Summary

;;; Commentary:
;;; This function returns the word count in the current buffer.

;;; Code:
(defun count-words-buffer ( )
  "Count the number of words in the current buffer;                             
print a message in the minibuffer with the result."
  (interactive)
  (let ((count 0))
    (save-excursion
      (goto-char (point-min))
      (while ( < (point) (point-max))
        (forward-word 1)
        (setq count (+ 1 count)))
      (message "buffer contains %d words." count))))

(provide 'count-words-buffer)
;;; count-words-buffer.el ends here
