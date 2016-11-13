;;; emacs-plugins --- Summary

;;; Commentary:
;;; This function moves the cursor to a position in the current buffer expressed
;;; as a percentage of the text in the buffer.

;;; Code:
(defun goto-percent (pct)
  "Move the cursor to a position expressed as PCT percent of current buffer."
  (interactive "nGoto percent: ")
  (let* ((size (point-max))
	 (charpos (/ (* size pct) 100)))
    (goto-char charpos)))

(provide 'goto-percent)
;;; goto-percent.el ends here
