(in-package #:rpi-dashboard.sensors)

(restas:define-route route-temperature-raw ("temperature")
  (list (get-current-temperature)))
