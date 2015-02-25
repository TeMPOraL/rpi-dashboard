(in-package #:rpi-dashboard)

(defun start ()
  (restas:start '#:rpi-dashboard :port 8192))
