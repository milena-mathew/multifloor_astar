;; Auto-generated. Do not edit!


(when (boundp 'map_store::SaveMap)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'SaveMap (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::SAVEMAP")
  (make-package "MAP_STORE::SAVEMAP"))
(unless (find-package "MAP_STORE::SAVEMAPREQUEST")
  (make-package "MAP_STORE::SAVEMAPREQUEST"))
(unless (find-package "MAP_STORE::SAVEMAPRESPONSE")
  (make-package "MAP_STORE::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass map_store::SaveMapRequest
  :super ros::object
  :slots (_map_name ))

(defmethod map_store::SaveMapRequest
  (:init
   (&key
    ((:map_name __map_name) "")
    )
   (send-super :init)
   (setq _map_name (string __map_name))
   self)
  (:map_name
   (&optional __map_name)
   (if __map_name (setq _map_name __map_name)) _map_name)
  (:serialization-length
   ()
   (+
    ;; string _map_name
    4 (length _map_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _map_name
       (write-long (length _map_name) s) (princ _map_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _map_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _map_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass map_store::SaveMapResponse
  :super ros::object
  :slots ())

(defmethod map_store::SaveMapResponse
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

(defclass map_store::SaveMap
  :super ros::object
  :slots ())

(setf (get map_store::SaveMap :md5sum-) "25e928a2d4ff388c294895b7af935978")
(setf (get map_store::SaveMap :datatype-) "map_store/SaveMap")
(setf (get map_store::SaveMap :request) map_store::SaveMapRequest)
(setf (get map_store::SaveMap :response) map_store::SaveMapResponse)

(defmethod map_store::SaveMapRequest
  (:response () (instance map_store::SaveMapResponse :init)))

(setf (get map_store::SaveMapRequest :md5sum-) "25e928a2d4ff388c294895b7af935978")
(setf (get map_store::SaveMapRequest :datatype-) "map_store/SaveMapRequest")
(setf (get map_store::SaveMapRequest :definition-)
      "# Service used to name the most recent saved map.

string map_name
---

")

(setf (get map_store::SaveMapResponse :md5sum-) "25e928a2d4ff388c294895b7af935978")
(setf (get map_store::SaveMapResponse :datatype-) "map_store/SaveMapResponse")
(setf (get map_store::SaveMapResponse :definition-)
      "# Service used to name the most recent saved map.

string map_name
---

")



(provide :map_store/SaveMap "25e928a2d4ff388c294895b7af935978")


