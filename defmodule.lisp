(restas:define-module #:rpi-dashboard
  (:use #:cl
        #:alexandria))

(restas:define-module #:rpi-dashboard.sensors
  (:use #:cl
        #:alexandria)

  (:nicknames #:rpd-sensors)

  (:render-method #'json:encode-json-to-string))

