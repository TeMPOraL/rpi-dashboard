(in-package #:rpi-dashboard.persistence)

(clsql:def-view-class sensor-value ()
  ((entry-id
    :db-kind :key
    :db-constraints (:auto-increment)
    :type integer
    :initarg :id
    )
   (sensor-id
    :type clsql:varchar
    :initarg :sensor-id)
   (value
    :type clsql:varchar
    :initarg :value)
   (timestamp
    :type clsql:bigint
    :initarg :timestamp)))

(defun initialize-store ()
  (unless clsql:*default-database*
    (clsql:connect '("sensors.db")
                   :database-type :sqlite3))

  (ignore-errors
    (clsql:create-view-from-class 'sensor-value)))

(defun persist-sensor-value (sensor-id value unix-timestamp)
  (let ((stored-value (make-instance 'sensor-value :sensor-id sensor-id :value value :timestamp unix-timestamp)))
      (clsql:update-records-from-instance stored-value)))
