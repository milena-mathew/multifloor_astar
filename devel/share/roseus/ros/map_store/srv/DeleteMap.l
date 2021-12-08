;; Auto-generated. Do not edit!


(when (boundp 'map_store::DeleteMap)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'DeleteMap (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::DELETEMAP")
  (make-package "MAP_STORE::DELETEMAP"))
(unless (find-package "MAP_STORE::DELETEMAPREQUEST")
  (make-package "MAP_STORE::DELETEMAPREQUEST"))
(unless (find-package "MAP_STORE::DELETEMAPRESPONSE")
  (make-package "MAP_STORE::DELETEMAPRESPONSE"))

(in-package "ROS")





(defclass map_store::DeleteMapRequest
  :super ros::object
  :slots (_map_id ))

(defmethod map_store::DeleteMapRequest
  (:init
   (&key
    ((:map_id __map_id) "")
    )
   (send-super :init)
   (setq _map_id (string __map_id))
   self)
  (:map_id
   (&optional __map_id)
   (if __map_id (setq _map_id __map_id)) _map_id)
  (:serialization-length
   ()
   (+
    ;; string _map_id
    4 (length _map_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _map_id
       (write-long (length _map_id) s) (princ _map_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _map_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _map_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass map_store::DeleteMapResponse
  :super ros::object
  :slots ())

(defmethod map_store::DeleteMapResponse
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

(defclass map_store::DeleteMap
  :super ros::object
  :slots ())

(setf (get map_store::DeleteMap :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::DeleteMap :datatype-) "map_store/DeleteMap")
(setf (get map_store::DeleteMap :request) map_store::DeleteMapRequest)
(setf (get map_store::DeleteMap :response) map_store::DeleteMapResponse)

(defmethod map_store::DeleteMapRequest
  (:response () (instance map_store::DeleteMapResponse :init)))

(setf (get map_store::DeleteMapRequest :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::DeleteMapRequest :datatype-) "map_store/DeleteMapRequest")
(setf (get map_store::DeleteMapRequest :definition-)
      "# Service used to delete a given map

string map_id
---

")

(setf (get map_store::DeleteMapResponse :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::DeleteMapResponse :datatype-) "map_store/DeleteMapResponse")
(setf (get map_store::DeleteMapResponse :definition-)
      "# Service used to delete a given map

string map_id
---

")



(provide :map_store/DeleteMap "d742ddbd5e3e8937162044ae4b300275")


