;; Auto-generated. Do not edit!


(when (boundp 'map_store::RenameMap)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'RenameMap (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::RENAMEMAP")
  (make-package "MAP_STORE::RENAMEMAP"))
(unless (find-package "MAP_STORE::RENAMEMAPREQUEST")
  (make-package "MAP_STORE::RENAMEMAPREQUEST"))
(unless (find-package "MAP_STORE::RENAMEMAPRESPONSE")
  (make-package "MAP_STORE::RENAMEMAPRESPONSE"))

(in-package "ROS")





(defclass map_store::RenameMapRequest
  :super ros::object
  :slots (_map_id _new_name ))

(defmethod map_store::RenameMapRequest
  (:init
   (&key
    ((:map_id __map_id) "")
    ((:new_name __new_name) "")
    )
   (send-super :init)
   (setq _map_id (string __map_id))
   (setq _new_name (string __new_name))
   self)
  (:map_id
   (&optional __map_id)
   (if __map_id (setq _map_id __map_id)) _map_id)
  (:new_name
   (&optional __new_name)
   (if __new_name (setq _new_name __new_name)) _new_name)
  (:serialization-length
   ()
   (+
    ;; string _map_id
    4 (length _map_id)
    ;; string _new_name
    4 (length _new_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _map_id
       (write-long (length _map_id) s) (princ _map_id s)
     ;; string _new_name
       (write-long (length _new_name) s) (princ _new_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _map_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _map_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _new_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _new_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass map_store::RenameMapResponse
  :super ros::object
  :slots ())

(defmethod map_store::RenameMapResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass map_store::RenameMap
  :super ros::object
  :slots ())

(setf (get map_store::RenameMap :md5sum-) "94f4d84fa2d3173899807933af417784")
(setf (get map_store::RenameMap :datatype-) "map_store/RenameMap")
(setf (get map_store::RenameMap :request) map_store::RenameMapRequest)
(setf (get map_store::RenameMap :response) map_store::RenameMapResponse)

(defmethod map_store::RenameMapRequest
  (:response () (instance map_store::RenameMapResponse :init)))

(setf (get map_store::RenameMapRequest :md5sum-) "94f4d84fa2d3173899807933af417784")
(setf (get map_store::RenameMapRequest :datatype-) "map_store/RenameMapRequest")
(setf (get map_store::RenameMapRequest :definition-)
      "# Service used to rename a given map.

string map_id
string new_name
---

")

(setf (get map_store::RenameMapResponse :md5sum-) "94f4d84fa2d3173899807933af417784")
(setf (get map_store::RenameMapResponse :datatype-) "map_store/RenameMapResponse")
(setf (get map_store::RenameMapResponse :definition-)
      "# Service used to rename a given map.

string map_id
string new_name
---

")



(provide :map_store/RenameMap "94f4d84fa2d3173899807933af417784")


