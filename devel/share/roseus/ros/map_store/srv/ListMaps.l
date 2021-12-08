;; Auto-generated. Do not edit!


(when (boundp 'map_store::ListMaps)
  (if (not (find-package "MAP_STORE"))
    (make-package "MAP_STORE"))
  (shadow 'ListMaps (find-package "MAP_STORE")))
(unless (find-package "MAP_STORE::LISTMAPS")
  (make-package "MAP_STORE::LISTMAPS"))
(unless (find-package "MAP_STORE::LISTMAPSREQUEST")
  (make-package "MAP_STORE::LISTMAPSREQUEST"))
(unless (find-package "MAP_STORE::LISTMAPSRESPONSE")
  (make-package "MAP_STORE::LISTMAPSRESPONSE"))

(in-package "ROS")





(defclass map_store::ListMapsRequest
  :super ros::object
  :slots ())

(defmethod map_store::ListMapsRequest
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

(defclass map_store::ListMapsResponse
  :super ros::object
  :slots (_map_list ))

(defmethod map_store::ListMapsResponse
  (:init
   (&key
    ((:map_list __map_list) (let (r) (dotimes (i 0) (push (instance map_store::MapListEntry :init) r)) r))
    )
   (send-super :init)
   (setq _map_list __map_list)
   self)
  (:map_list
   (&rest __map_list)
   (if (keywordp (car __map_list))
       (send* _map_list __map_list)
     (progn
       (if __map_list (setq _map_list (car __map_list)))
       _map_list)))
  (:serialization-length
   ()
   (+
    ;; map_store/MapListEntry[] _map_list
    (apply #'+ (send-all _map_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; map_store/MapListEntry[] _map_list
     (write-long (length _map_list) s)
     (dolist (elem _map_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; map_store/MapListEntry[] _map_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _map_list (let (r) (dotimes (i n) (push (instance map_store::MapListEntry :init) r)) r))
     (dolist (elem- _map_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass map_store::ListMaps
  :super ros::object
  :slots ())

(setf (get map_store::ListMaps :md5sum-) "ca5a33dd106a2c24cfd54c927d214957")
(setf (get map_store::ListMaps :datatype-) "map_store/ListMaps")
(setf (get map_store::ListMaps :request) map_store::ListMapsRequest)
(setf (get map_store::ListMaps :response) map_store::ListMapsResponse)

(defmethod map_store::ListMapsRequest
  (:response () (instance map_store::ListMapsResponse :init)))

(setf (get map_store::ListMapsRequest :md5sum-) "ca5a33dd106a2c24cfd54c927d214957")
(setf (get map_store::ListMapsRequest :datatype-) "map_store/ListMapsRequest")
(setf (get map_store::ListMapsRequest :definition-)
      "# Service used to list the most recent map from every map-making session.

# No arguments at this time.
---
MapListEntry[] map_list


================================================================================
MSG: map_store/MapListEntry
# One entry in a list of maps.

# Naming a map is optional.
string name

# Maps made by the make-a-map app are given a session ID, which is the
# time when the map-making session was started, expressed as seconds
# since the epoch and converted to a string.
string session_id

# Creation time of this map, in seconds since the epoch.
int64 date

# Unique ID of this map.
string map_id
")

(setf (get map_store::ListMapsResponse :md5sum-) "ca5a33dd106a2c24cfd54c927d214957")
(setf (get map_store::ListMapsResponse :datatype-) "map_store/ListMapsResponse")
(setf (get map_store::ListMapsResponse :definition-)
      "# Service used to list the most recent map from every map-making session.

# No arguments at this time.
---
MapListEntry[] map_list


================================================================================
MSG: map_store/MapListEntry
# One entry in a list of maps.

# Naming a map is optional.
string name

# Maps made by the make-a-map app are given a session ID, which is the
# time when the map-making session was started, expressed as seconds
# since the epoch and converted to a string.
string session_id

# Creation time of this map, in seconds since the epoch.
int64 date

# Unique ID of this map.
string map_id
")



(provide :map_store/ListMaps "ca5a33dd106a2c24cfd54c927d214957")


