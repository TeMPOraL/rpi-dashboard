(in-package #:rpi-dashboard)

(restas:mount-module -sensors (#:rpi-dashboard.sensors)
  (:url "sensors"))

(restas:define-route route-main ("")
  (who:with-html-output-to-string (out)
    (:html
     (:head
      (:title "Raspberry Pi 2 Dashboard"))

     (:body
      (:h1 "Welcome to TRC's Raspberry Pi 2 Dashboard!")
      (:p (who:fmt "Current SOC temperature: ~A°C." (/ (float (rpd-sensors::get-current-temperature))
                                                    1000)))))))
