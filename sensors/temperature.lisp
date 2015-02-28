(in-package #:rpi-dashboard.sensors)

(defvar *internal-temperature-sensor-file* #P"/sys/class/thermal/thermal_zone0/temp")

(defun get-current-temperature ()
  (with-open-file (stream *internal-temperature-sensor-file*)
    (parse-integer (read-line stream) :junk-allowed t)))
