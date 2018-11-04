; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude Stm.msg.html

(cl:defclass <Stm> (roslisp-msg-protocol:ros-message)
  ((str_stm32
    :reader str_stm32
    :initarg :str_stm32
    :type cl:integer
    :initform 0))
)

(cl:defclass Stm (<Stm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<Stm> is deprecated: use beginner_tutorials-msg:Stm instead.")))

(cl:ensure-generic-function 'str_stm32-val :lambda-list '(m))
(cl:defmethod str_stm32-val ((m <Stm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:str_stm32-val is deprecated.  Use beginner_tutorials-msg:str_stm32 instead.")
  (str_stm32 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stm>) ostream)
  "Serializes a message object of type '<Stm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'str_stm32)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stm>) istream)
  "Deserializes a message object of type '<Stm>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'str_stm32)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stm>)))
  "Returns string type for a message object of type '<Stm>"
  "beginner_tutorials/Stm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stm)))
  "Returns string type for a message object of type 'Stm"
  "beginner_tutorials/Stm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stm>)))
  "Returns md5sum for a message object of type '<Stm>"
  "1c6055aba10322f460b6d9d30419af9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stm)))
  "Returns md5sum for a message object of type 'Stm"
  "1c6055aba10322f460b6d9d30419af9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stm>)))
  "Returns full string definition for message of type '<Stm>"
  (cl:format cl:nil "char str_stm32~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stm)))
  "Returns full string definition for message of type 'Stm"
  (cl:format cl:nil "char str_stm32~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stm>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stm>))
  "Converts a ROS message object to a list"
  (cl:list 'Stm
    (cl:cons ':str_stm32 (str_stm32 msg))
))
