(defun goto-bob ()
  (goto-char (point-min)))

;; from with-string-as-buffer-contents from
;; xemacs-21.4.22/lisp/subr.el and added (goto-bob)
(defmacro with-string-as-buffer (str &rest body)
  "With the contents of the current buffer being STR, run BODY.
Returns the new contents of the buffer, as modified by BODY.
The original current buffer is restored afterwards."
  `(with-temp-buffer
     (insert ,str)
     (goto-bob)
     ,@body
     (buffer-string)))

(defun replace-string-in-string (str old new)
  (with-string-as-buffer str
                         (while (search-forward old nil t)
                           (replace-match new))))

(defun current-buffer-file-name ()
  (buffer-file-name (current-buffer)))

(defun ediff-with-trunk ()
  (interactive)
  (let ((cur-fn (current-buffer-file-name)))
    (ediff-files
     (replace-string-in-string cur-fn
                               old
                               new)
     cur-fn)))
