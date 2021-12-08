;; Auto-generated. Do not edit!


(when (boundp 'multi_map_navigation::SetMap)
  (if (not (find-package "MULTI_MAP_NAVIGATION"))
    (make-package "MULTI_MAP_NAVIGATION"))
  (shadow 'SetMap (find-package "MULTI_MAP_NAVIGATION")))
(unless (find-package "MULTI_MAP_NAVIGATION::SETMAP")
  (make-package "MULTI_MAP_NAVIGATION::SETMAP"))
(unless (find-package "MULTI_MAP_NAVIGATION::SETMAPREQUEST")
  (make-package "MULTI_MAP_NAVIGATION::SETMAPREQUEST"))
(unless (find-package "MULTI_MAP_NAVIGATION::SETMAPRESPONSE")
  (make-package "MULTI_MAP_NAVIGATION::SETMAPRESPONSE"))

(in-package "ROS")





(defclass multi_map_navigation::SetMapRequest
  :super ros::object
  :slots (_name ))

(defmethod multi_map_navigation::SetMapRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass multi_map_navigation::SetMapResponse
  :super ros::object
  :slots ())

(defmethod multi_map_navigation::SetMapResponse
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

(defclass multi_map_navigation::SetMap
  :super ros::object
  :slots ())

(setf (get multi_map_navigation::SetMap :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get multi_map_navigation::SetMap :datatype-) "multi_map_navigation/SetMap")
(setf (get multi_map_navigation::SetMap :request) multi_map_navigation::SetMapRequest)
(setf (get multi_map_navigation::SetMap :response) multi_map_navigation::SetMapResponse)

(defmethod multi_map_navigation::SetMapRequest
  (:response () (instance multi_map_navigation::SetMapResponse :init)))

(setf (get multi_map_navigation::SetMapRequest :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get multi_map_navigation::SetMapRequest :datatype-) "multi_map_navigation/SetMapRequest")
(setf (get multi_map_navigation::SetMapRequest :definition-)
      "string name
---
")

(setf (get multi_map_navigation::SetMapResponse :md5sum-) "c1f3d28f1b044c871e6eff2e9fc3c667")
(setf (get multi_map_navigation::SetMapResponse :datatype-) "multi_map_navigation/SetMapResponse")
(setf (get multi_map_navigation::SetMapResponse :definition-)
      "string name
---
")



(provide :multi_map_navigation/SetMap "c1f3d28f1b044c871e6eff2e9fc3c667")


