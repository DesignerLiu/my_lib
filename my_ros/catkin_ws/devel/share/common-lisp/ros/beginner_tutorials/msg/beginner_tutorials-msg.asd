
(cl:in-package :asdf)

(defsystem "beginner_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Stm" :depends-on ("_package_Stm"))
    (:file "_package_Stm" :depends-on ("_package"))
  ))