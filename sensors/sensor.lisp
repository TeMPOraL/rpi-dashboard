(in-package #:rpi-dashboard.sensors)

(defvar *registered-sensors* (make-hash-table :test 'equalp) "A hash table containing all registered, recognized sensors.")

(defclass sensor ()
  ((id :initarg :id
       :initform (error "Need to provide sensor ID."))
   (name :type 'string
         :initarg :name
         :initform "Unknown sensor")
   (unit :initarg :unit)
   (precision :initarg :precision
              :initform :unknown)
   (resolution :initform :resolution
               :initarg :unknown)
   (polling-interface :initarg :poll)
   (management-interface :initarg :manage)
   (tags :initarg :tags
         :initform '())))

(defmethod read-value ((sensor sensor))
  (with-slots (id polling-interface unit) sensor
    (if (eql polling-interface :PUSH)
        (fetch-value-from-remote-sensor id)
        (funcall polling-interface))))

(defmethod print-object ((sensor sensor) stream)
  (print-unreadable-object (sensor stream :type t :identity t)
    (with-slots (id name unit precision resolution tags) sensor
      (format stream "~A ~A [~A] ±~A res ~A (~{~A ~})" id name unit precision resolution tags)))) ;FIXME need a unit printer

(defun register-sensor (sensor)
  "Register a `SENSOR' to be globally available."
  (setf (gethash (slot-value sensor 'id)) sensor))
