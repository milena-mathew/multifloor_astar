; Auto-generated. Do not edit!


(cl:in-package map_store-srv)


;//! \htmlinclude SetOrigin-request.msg.html

(cl:defclass <SetOrigin-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform "")
   (pos_x
    :reader pos_x
    :initarg :pos_x
    :type cl:float
    :initform 0.0)
   (pos_y
    :reader pos_y
    :initarg :pos_y
    :type cl:float
    :initform 0.0)
   (rot_x
    :reader rot_x
    :initarg :rot_x
    :type cl:float
    :initform 0.0)
   (rot_y
    :reader rot_y
    :initarg :rot_y
    :type cl:float
    :initform 0.0)
   (rot_z
    :reader rot_z
    :initarg :rot_z
    :type cl:float
    :initform 0.0)
   (rot_w
    :reader rot_w
    :initarg :rot_w
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetOrigin-request (<SetOrigin-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetOrigin-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetOrigin-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_store-srv:<SetOrigin-request> is deprecated: use map_store-srv:SetOrigin-request instead.")))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:map_id-val is deprecated.  Use map_store-srv:map_id instead.")
  (map_id m))

(cl:ensure-generic-function 'pos_x-val :lambda-list '(m))
(cl:defmethod pos_x-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:pos_x-val is deprecated.  Use map_store-srv:pos_x instead.")
  (pos_x m))

(cl:ensure-generic-function 'pos_y-val :lambda-list '(m))
(cl:defmethod pos_y-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:pos_y-val is deprecated.  Use map_store-srv:pos_y instead.")
  (pos_y m))

(cl:ensure-generic-function 'rot_x-val :lambda-list '(m))
(cl:defmethod rot_x-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:rot_x-val is deprecated.  Use map_store-srv:rot_x instead.")
  (rot_x m))

(cl:ensure-generic-function 'rot_y-val :lambda-list '(m))
(cl:defmethod rot_y-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:rot_y-val is deprecated.  Use map_store-srv:rot_y instead.")
  (rot_y m))

(cl:ensure-generic-function 'rot_z-val :lambda-list '(m))
(cl:defmethod rot_z-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:rot_z-val is deprecated.  Use map_store-srv:rot_z instead.")
  (rot_z m))

(cl:ensure-generic-function 'rot_w-val :lambda-list '(m))
(cl:defmethod rot_w-val ((m <SetOrigin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_store-srv:rot_w-val is deprecated.  Use map_store-srv:rot_w instead.")
  (rot_w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetOrigin-request>) ostream)
  "Serializes a message object of type '<SetOrigin-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rot_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rot_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rot_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rot_w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetOrigin-request>) istream)
  "Deserializes a message object of type '<SetOrigin-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'map_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rot_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rot_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rot_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rot_w) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetOrigin-request>)))
  "Returns string type for a service object of type '<SetOrigin-request>"
  "map_store/SetOriginRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrigin-request)))
  "Returns string type for a service object of type 'SetOrigin-request"
  "map_store/SetOriginRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetOrigin-request>)))
  "Returns md5sum for a message object of type '<SetOrigin-request>"
  "9c17e99b9635aa83a73123978f777ac2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetOrigin-request)))
  "Returns md5sum for a message object of type 'SetOrigin-request"
  "9c17e99b9635aa83a73123978f777ac2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetOrigin-request>)))
  "Returns full string definition for message of type '<SetOrigin-request>"
  (cl:format cl:nil "# Service used to set the map origin dynamically~%string map_id~%~%float32 pos_x~%float32 pos_y~%~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetOrigin-request)))
  "Returns full string definition for message of type 'SetOrigin-request"
  (cl:format cl:nil "# Service used to set the map origin dynamically~%string map_id~%~%float32 pos_x~%float32 pos_y~%~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetOrigin-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetOrigin-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetOrigin-request
    (cl:cons ':map_id (map_id msg))
    (cl:cons ':pos_x (pos_x msg))
    (cl:cons ':pos_y (pos_y msg))
    (cl:cons ':rot_x (rot_x msg))
    (cl:cons ':rot_y (rot_y msg))
    (cl:cons ':rot_z (rot_z msg))
    (cl:cons ':rot_w (rot_w msg))
))
;//! \htmlinclude SetOrigin-response.msg.html

(cl:defclass <SetOrigin-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetOrigin-response (<SetOrigin-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetOrigin-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetOrigin-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_store-srv:<SetOrigin-response> is deprecated: use map_store-srv:SetOrigin-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetOrigin-response>) ostream)
  "Serializes a message object of type '<SetOrigin-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetOrigin-response>) istream)
  "Deserializes a message object of type '<SetOrigin-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetOrigin-response>)))
  "Returns string type for a service object of type '<SetOrigin-response>"
  "map_store/SetOriginResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrigin-response)))
  "Returns string type for a service object of type 'SetOrigin-response"
  "map_store/SetOriginResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetOrigin-response>)))
  "Returns md5sum for a message object of type '<SetOrigin-response>"
  "9c17e99b9635aa83a73123978f777ac2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetOrigin-response)))
  "Returns md5sum for a message object of type 'SetOrigin-response"
  "9c17e99b9635aa83a73123978f777ac2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetOrigin-response>)))
  "Returns full string definition for message of type '<SetOrigin-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetOrigin-response)))
  "Returns full string definition for message of type 'SetOrigin-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetOrigin-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetOrigin-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetOrigin-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetOrigin)))
  'SetOrigin-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetOrigin)))
  'SetOrigin-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetOrigin)))
  "Returns string type for a service object of type '<SetOrigin>"
  "map_store/SetOrigin")