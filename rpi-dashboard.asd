;;; Dashboard system definition.

(asdf:defsystem #:rpi-dashboard
  :serial t
  :description "Some fooling around with Raspberry Pi 2."
  :author "Jacek TeMPOraL Złydach"
  :depends-on (#:alexandria
               #:cl-json
               #:restas
               #:local-time)

  :components ((:file "package")
               (:file "main")))
