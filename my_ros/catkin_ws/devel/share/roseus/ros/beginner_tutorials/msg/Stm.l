;; Auto-generated. Do not edit!


(when (boundp 'beginner_tutorials::Stm)
  (if (not (find-package "BEGINNER_TUTORIALS"))
    (make-package "BEGINNER_TUTORIALS"))
  (shadow 'Stm (find-package "BEGINNER_TUTORIALS")))
(unless (find-package "BEGINNER_TUTORIALS::STM")
  (make-package "BEGINNER_TUTORIALS::STM"))

(in-package "ROS")
;;//! \htmlinclude Stm.msg.html


(defclass beginner_tutorials::Stm
  :super ros::object
  :slots (_str_stm32 ))

(defmethod beginner_tutorials::Stm
  (:init
   (&key
    ((:str_stm32 __str_stm32) 0)
    )
   (send-super :init)
   (setq _str_stm32 (round __str_stm32))
   self)
  (:str_stm32
   (&optional __str_stm32)
   (if __str_stm32 (setq _str_stm32 __str_stm32)) _str_stm32)
  (:serialization-length
   ()
   (+
    ;; char _str_stm32
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _str_stm32
       (write-byte _str_stm32 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _str_stm32
     (setq _str_stm32 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get beginner_tutorials::Stm :md5sum-) "1c6055aba10322f460b6d9d30419af9c")
(setf (get beginner_tutorials::Stm :datatype-) "beginner_tutorials/Stm")
(setf (get beginner_tutorials::Stm :definition-)
      "char str_stm32

")



(provide :beginner_tutorials/Stm "1c6055aba10322f460b6d9d30419af9c")


