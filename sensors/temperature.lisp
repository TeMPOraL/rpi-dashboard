(in-package #:rpi-dashboard.sensors)

(defun get-current-temperature ()
  (with-open-file (stream "/sys/class/thermal/thermal_zone0/temp")
    (parse-integer (read-line stream) :junk-allowed t)))
