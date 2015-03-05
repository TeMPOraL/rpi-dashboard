(in-package #:rpi-dashboard.sensors)

(defun get-uptime-string ()
  (with-open-stream (s (make-string-output-stream))
    (external-program:run "uptime" '()  :output s)
    (string-trim '(#\Newline #\Space) (get-output-stream-string s))))
