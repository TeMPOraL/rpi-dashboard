(restas:define-module #:rpi-dashboard
  (:use #:cl
        #:alexandria))

(restas:define-module #:rpi-dashboard.sensors
  (:use #:cl
        #:alexandria)

  (:nicknames #:rpd-sensors)

  (:render-method #'json:encode-json-to-string))

(defpackage #:rpi-dashboard.persistence
  (:use #:cl
        #:alexandria)
  (:nicknames #:rpd-persistence)

  (:export #:initialize-store
           #:persist-sensor-value))

