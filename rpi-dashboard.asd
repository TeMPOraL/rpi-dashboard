;;; Dashboard system definition.

(asdf:defsystem #:rpi-dashboard
  :serial t
  :description "Some fooling around with Raspberry Pi 2."
  :author "Jacek TeMPOraL Złydach"
  :depends-on (#:alexandria
               #:cl-json
               #:cl-who
               #:restas
               #:local-time
               #:external-program
               #:clsql
               #:clsql-sqlite3)

  :components ((:file "defmodule")
               (:file "routes")

               (:module "persistence"
                        :components ((:file "persistence")))

               (:module "sensors"
                        :components ((:file "routes")
                                     (:file "DS18B20")
                                     (:file "temperature")
                                     (:file "system")
                                     (:file "remote")))
               (:file "main")))
