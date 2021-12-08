; Auto-generated. Do not edit!


(cl:in-package multi_map_navigation-msg)


;//! \htmlinclude MultiMapNavigationTransitionGoal.msg.html

(cl:defclass <MultiMapNavigationTransitionGoal> (roslisp-msg-protocol:ros-message)
  ((wormhole
    :reader wormhole
    :initarg :wormhole
    :type cl:string
    :initform "")
   (start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0)
   (end
    :reader end
    :initarg :end
    :type cl:integer
    :initform 0))
)

(cl:defclass MultiMapNavigationTransitionGoal (<MultiMapNavigationTransitionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiMapNavigationTransitionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiMapNavigationTransitionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name multi_map_navigation-msg:<MultiMapNavigationTransitionGoal> is deprecated: use multi_map_navigation-msg:MultiMapNavigationTransitionGoal instead.")))

(cl:ensure-generic-function 'wormhole-val :lambda-list '(m))
(cl:defmethod wormhole-val ((m <MultiMapNavigationTransitionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multi_map_navigation-msg:wormhole-val is deprecated.  Use multi_map_navigation-msg:wormhole instead.")
  (wormhole m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <MultiMapNavigationTransitionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multi_map_navigation-msg:start-val is deprecated.  Use multi_map_navigation-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'end-val :lambda-list '(m))
(cl:defmethod end-val ((m <MultiMapNavigationTransitionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader multi_map_navigation-msg:end-val is deprecated.  Use multi_map_navigation-msg:end instead.")
  (end m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiMapNavigationTransitionGoal>) ostream)
  "Serializes a message object of type '<MultiMapNavigationTransitionGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wormhole))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wormhole))
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'end)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiMapNavigationTransitionGoal>) istream)
  "Deserializes a message object of type '<MultiMapNavigationTransitionGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wormhole) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wormhole) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'end) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiMapNavigationTransitionGoal>)))
  "Returns string type for a message object of type '<MultiMapNavigationTransitionGoal>"
  "multi_map_navigation/MultiMapNavigationTransitionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiMapNavigationTransitionGoal)))
  "Returns string type for a message object of type 'MultiMapNavigationTransitionGoal"
  "multi_map_navigation/MultiMapNavigationTransitionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiMapNavigationTransitionGoal>)))
  "Returns md5sum for a message object of type '<MultiMapNavigationTransitionGoal>"
  "5b23d9c1c602bed1aeb3537d1b61abd3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiMapNavigationTransitionGoal)))
  "Returns md5sum for a message object of type 'MultiMapNavigationTransitionGoal"
  "5b23d9c1c602bed1aeb3537d1b61abd3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiMapNavigationTransitionGoal>)))
  "Returns full string definition for message of type '<MultiMapNavigationTransitionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string wormhole~%int32 start~%int32 end~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiMapNavigationTransitionGoal)))
  "Returns full string definition for message of type 'MultiMapNavigationTransitionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string wormhole~%int32 start~%int32 end~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiMapNavigationTransitionGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'wormhole))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiMapNavigationTransitionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiMapNavigationTransitionGoal
    (cl:cons ':wormhole (wormhole msg))
    (cl:cons ':start (start msg))
    (cl:cons ':end (end msg))
))
