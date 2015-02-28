;;; Dashboard system definition.

(asdf:defsystem #:rpi-dashboard
  :serial t
  :description "Some fooling around with Raspberry Pi 2."
  :author "Jacek TeMPOraL Złydach"
  :depends-on (#:alexandria
               #:cl-json
               #:cl-who
               #:restas
               #:local-time)

  :components ((:file "defmodule")
               (:file "routes")

               (:module "sensors"
                        :components ((:file "routes")
                                     (:file "temperature")))
               
               (:file "main")))
