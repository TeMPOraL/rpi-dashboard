(in-package #:rpi-dashboard)

(restas:mount-module -sensors (#:rpi-dashboard.sensors)
  (:url "sensors"))

(restas:define-route route-main ("")
  "hullo!")
