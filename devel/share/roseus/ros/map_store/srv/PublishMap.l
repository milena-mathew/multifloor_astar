;; Auto-generated. Do not edit!


(when (boundp 'map_store::PublishMap)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'PublishMap (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::PUBLISHMAP")
  (make-package "MAP_STORE::PUBLISHMAP"))
(unless (find-package "MAP_STORE::PUBLISHMAPREQUEST")
  (make-package "MAP_STORE::PUBLISHMAPREQUEST"))
(unless (find-package "MAP_STORE::PUBLISHMAPRESPONSE")
  (make-package "MAP_STORE::PUBLISHMAPRESPONSE"))

(in-package "ROS")





(defclass map_store::PublishMapRequest
  :super ros::object
  :slots (_map_id ))

(defmethod map_store::PublishMapRequest
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

(defclass map_store::PublishMapResponse
  :super ros::object
  :slots ())

(defmethod map_store::PublishMapResponse
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

(defclass map_store::PublishMap
  :super ros::object
  :slots ())

(setf (get map_store::PublishMap :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::PublishMap :datatype-) "map_store/PublishMap")
(setf (get map_store::PublishMap :request) map_store::PublishMapRequest)
(setf (get map_store::PublishMap :response) map_store::PublishMapResponse)

(defmethod map_store::PublishMapRequest
  (:response () (instance map_store::PublishMapResponse :init)))

(setf (get map_store::PublishMapRequest :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::PublishMapRequest :datatype-) "map_store/PublishMapRequest")
(setf (get map_store::PublishMapRequest :definition-)
      "# Service used to publish a given map from the database to the /map topic.

string map_id
---

")

(setf (get map_store::PublishMapResponse :md5sum-) "d742ddbd5e3e8937162044ae4b300275")
(setf (get map_store::PublishMapResponse :datatype-) "map_store/PublishMapResponse")
(setf (get map_store::PublishMapResponse :definition-)
      "# Service used to publish a given map from the database to the /map topic.

string map_id
---

")



(provide :map_store/PublishMap "d742ddbd5e3e8937162044ae4b300275")


