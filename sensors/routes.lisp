(in-package #:rpi-dashboard.sensors)

(restas:define-route route-temperature-raw ("internal-temperature")
  (list (get-current-temperature)))

(restas:define-route route-temperature-external ("external-temperature")
  (list (read-DS18B20-temperature)))
