;;; emacs-plugins -- Print the number of words in a selected region.

;;; Commentary:
;; This function prints the number of words in a selected region.

;;; Code:
(defun count-words-selected-region (start end)
  "Count the number of words in a region bounded by START and END;
print a message in the minibuffer with the result."
  (interactive "r")
  (let ((wordcount 0))
    (save-excursion
      (goto-char start)
      (while ( < (point) end)
	(forward-word 1)
	(setq wordcount (+ 1 wordcount)))
      (message "Selected region contains %d words." wordcount))))

(provide 'count-words-selected-region)
;;; count-words-selected-region.el ends here
