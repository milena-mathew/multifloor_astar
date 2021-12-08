;; Auto-generated. Do not edit!


(when (boundp 'map_store::SetOrigin)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'SetOrigin (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::SETORIGIN")
  (make-package "MAP_STORE::SETORIGIN"))
(unless (find-package "MAP_STORE::SETORIGINREQUEST")
  (make-package "MAP_STORE::SETORIGINREQUEST"))
(unless (find-package "MAP_STORE::SETORIGINRESPONSE")
  (make-package "MAP_STORE::SETORIGINRESPONSE"))

(in-package "ROS")





(defclass map_store::SetOriginRequest
  :super ros::object
  :slots (_map_id _pos_x _pos_y _rot_x _rot_y _rot_z _rot_w ))

(defmethod map_store::SetOriginRequest
  (:init
   (&key
    ((:map_id __map_id) "")
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:rot_x __rot_x) 0.0)
    ((:rot_y __rot_y) 0.0)
    ((:rot_z __rot_z) 0.0)
    ((:rot_w __rot_w) 0.0)
    )
   (send-super :init)
   (setq _map_id (string __map_id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _rot_x (float __rot_x))
   (setq _rot_y (float __rot_y))
   (setq _rot_z (float __rot_z))
   (setq _rot_w (float __rot_w))
   self)
  (:map_id
   (&optional __map_id)
   (if __map_id (setq _map_id __map_id)) _map_id)
  (:pos_x
   (&optional __pos_x)
   (if __pos_x (setq _pos_x __pos_x)) _pos_x)
  (:pos_y
   (&optional __pos_y)
   (if __pos_y (setq _pos_y __pos_y)) _pos_y)
  (:rot_x
   (&optional __rot_x)
   (if __rot_x (setq _rot_x __rot_x)) _rot_x)
  (:rot_y
   (&optional __rot_y)
   (if __rot_y (setq _rot_y __rot_y)) _rot_y)
  (:rot_z
   (&optional __rot_z)
   (if __rot_z (setq _rot_z __rot_z)) _rot_z)
  (:rot_w
   (&optional __rot_w)
   (if __rot_w (setq _rot_w __rot_w)) _rot_w)
  (:serialization-length
   ()
   (+
    ;; string _map_id
    4 (length _map_id)
    ;; float32 _pos_x
    4
    ;; float32 _pos_y
    4
    ;; float32 _rot_x
    4
    ;; float32 _rot_y
    4
    ;; float32 _rot_z
    4
    ;; float32 _rot_w
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _map_id
       (write-long (length _map_id) s) (princ _map_id s)
     ;; float32 _pos_x
       (sys::poke _pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_y
       (sys::poke _pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rot_x
       (sys::poke _rot_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rot_y
       (sys::poke _rot_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rot_z
       (sys::poke _rot_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rot_w
       (sys::poke _rot_w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _map_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _map_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _pos_x
     (setq _pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_y
     (setq _pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rot_x
     (setq _rot_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rot_y
     (setq _rot_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rot_z
     (setq _rot_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rot_w
     (setq _rot_w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass map_store::SetOriginResponse
  :super ros::object
  :slots ())

(defmethod map_store::SetOriginResponse
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

(defclass map_store::SetOrigin
  :super ros::object
  :slots ())

(setf (get map_store::SetOrigin :md5sum-) "9c17e99b9635aa83a73123978f777ac2")
(setf (get map_store::SetOrigin :datatype-) "map_store/SetOrigin")
(setf (get map_store::SetOrigin :request) map_store::SetOriginRequest)
(setf (get map_store::SetOrigin :response) map_store::SetOriginResponse)

(defmethod map_store::SetOriginRequest
  (:response () (instance map_store::SetOriginResponse :init)))

(setf (get map_store::SetOriginRequest :md5sum-) "9c17e99b9635aa83a73123978f777ac2")
(setf (get map_store::SetOriginRequest :datatype-) "map_store/SetOriginRequest")
(setf (get map_store::SetOriginRequest :definition-)
      "# Service used to set the map origin dynamically
string map_id

float32 pos_x
float32 pos_y

float32 rot_x
float32 rot_y
float32 rot_z
float32 rot_w
---
")

(setf (get map_store::SetOriginResponse :md5sum-) "9c17e99b9635aa83a73123978f777ac2")
(setf (get map_store::SetOriginResponse :datatype-) "map_store/SetOriginResponse")
(setf (get map_store::SetOriginResponse :definition-)
      "# Service used to set the map origin dynamically
string map_id

float32 pos_x
float32 pos_y

float32 rot_x
float32 rot_y
float32 rot_z
float32 rot_w
---
")



(provide :map_store/SetOrigin "9c17e99b9635aa83a73123978f777ac2")


