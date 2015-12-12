(in-package #:rpi-dashboard.sensors)

(restas:define-route route-temperature-raw ("internal-temperature")
  (list (get-current-temperature)))

(restas:define-route route-temperature-external ("external-temperature")
  (list (read-DS18B20-temperature)))

(restas:define-route route-temperature-external ("uptime")
  (list (get-uptime-string)))

(restas:define-route route-remote-store-value ("remote-value/:id" :method :post)
  (store-remote-value id (hunchentoot:post-parameter "value")))

(restas:define-route route-remote-register-sensor ("remote-sensor" :method :post)
  nil                                   ;TODO register remote sensor
  )
