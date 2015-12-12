(in-package #:rpi-dashboard.sensors)

(defun store-remote-value (sensor-id value)
  (rpd-persistence:persist-sensor-value sensor-id value (local-time:timestamp-to-unix (local-time:now))) )
