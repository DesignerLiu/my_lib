#!/usr/bin/env python

import roslib

roslib.load_manifest('video_stream_opencv')
import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import  String
class image_converter:
	
	def __init__(self):
		self.bridge = CvBridge()
		self.image_sub = rospy.Subscriber("image_topic", Image, self.callback)		

	def callback(self, data):
		try:
			cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
		except CvBridgeError as e:
			print(e)
		
		
		###########################################################################
		imgray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
		ret, thresh = cv2.threshold(imgray,127,255,0)
		image, contours, hierarchy = cv2.findContours(thresh, 1, 2)
		cnt = contours[0]
		M = cv2.moments(cnt)
		print M
		cx = int(M['m10']/M['m00'])
		cy = int(M['m01']/M['m00'])
		print("cx = %d; cy=%d"% (cx, cy))
		cx = str(cx)
		cy = str(cy)
		list_value = ['0xcx', cx, '0xcy', cy]  
		str_send = "".join(list_value)
		
		cv2.imshow('thresh',thresh)
		
		
		###########################################################################
		rospy.loginfo(str_send)
		pub.publish(str_send)
		cv2.waitKey(1)
		
if __name__ == '__main__':
        pub = rospy.Publisher('uart_send01', String, queue_size=10)
	ic = image_converter()
	rospy.init_node('image_converter')
	try:
		rospy.spin()
	except KeyboardInterrupt:
		print("Shutting down")
	cv2.destroyAllWindows()

