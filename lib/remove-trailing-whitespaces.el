;;; emacs-plugins --- Remove trailing whitespaces in current buffer.

;;; Commentary:
;; This module highlights and removes (if prompted) trailing whitespaces
;; in a buffer.
;; TODO(hieule): Remove trailing blank lines.

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
;;; remove-trailing-whitespaces.el ends here
