;;; emacs-plugins --- Hieu Le's Elisp library.

;;; Commentary:
;; This file contains the definitions of all Elisp functions from this
;; respository, aggregated here for convenient startup loading.

;;; Code:

(defun move-end-of-line-before-whitespace ()
  "Move point to the last non-whitespace character in the current line."
  (move-end-of-line nil)
  (re-search-backward "^\\|[^[:space:]]"))

(defun remove-trailing-whitespaces ( )
  "Highlight and remove trailing whitespaces in current buffer;
press space to remove and delete to skip."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while ( < (point) (point-max))
      (move-end-of-line-before-whitespace)
      ;; Move point to first trailing whitespace of current line, if any.
      (if (not (eolp))
	  (forward-char))
      (if (not (eolp))
	  (progn
	    (set-mark (point))
	    (move-end-of-line 1)
	    (if (y-or-n-p "Delete? ")
		(backward-delete-char-untabify 1))))
      (forward-line 1))))
 
(provide 'remove-trailing-whitespaces)

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

(defun goto-percent (pct)
  "Move the cursor to a position expressed as PCT percent of current buffer."
  (interactive "nGoto percent: ")
  (let* ((size (point-max))
	 (charpos (/ (* size pct) 100)))
    (goto-char charpos)))

(provide 'goto-percent)

;;; hieule-library.el ends here
