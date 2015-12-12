(in-package #:rpi-dashboard)

(defun start ()
  (rpd-persistence:initialize-store)
  (restas:start '#:rpi-dashboard :port 8192))
