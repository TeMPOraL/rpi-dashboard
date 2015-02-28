(in-package #:rpi-dashboard.sensors)

(defvar *ds18b20-sensor-file* #P"/sys/bus/w1/devices/28-00044115f1ff/w1_slave")

(defun read-DS18B20-temperature ()
  (with-open-file (stream *ds18b20-sensor-file*)
    (let ((control-line (read-line stream))
          (temperature-line (read-line stream)))
      (when (search "YES" control-line)
        (parse-integer (subseq temperature-line (+ 2 (search "t=" temperature-line)))
                       :junk-allowed t)))))
