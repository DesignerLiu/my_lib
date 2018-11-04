import sys
import rospy
import serial
from std_msgs.msg import String


def uart_init(resource):
	resource = int (resource)
	if resource > 0:
		ser = serial.Serial('/dev/ttyUSB0', resource, timeout=0.5) 
		print"Your option is" + resource
	else:
		print"Your enter is ERROR!"
		exit(0)
	if not ser.isOpen():
		print"ERROR::::Uart is closed!"
		exit(0)
	rospy.init_node('usart', anonymous=True)

def callback(data):
        while(1):
                 ser.write('Px0%sSx0',data.data)
           	 if(ser.read(2) == "ok"):
   	         	break
		 else:
			print"Value is sended"
                 rospy.loginfo(rospy.get_caller_id() + 'Send Succussed', data.data)


def usart_receive_and_send():	
	pub = rospy.Publisher('message01', String, queue_size=200)
	rate = rospy.Rate(10)
	while not rospy.is_shutdown():
		receive = ser.readline()
               	if receive.startswith('Ax0'):
                       	del receive[0:2]
                       	message01 = receive
               	elif receive.startswith('Bx0'):
                       	del receive[0:2]
                       	message02 = receive
               	receive = 0   	
		
		rospy.loginfo(message01)
		pub.publish(message01)
		
		rospy.Subscriber('uart_send01', String, callback)
		rate.sleep()
	
#	def usart_send():
if __name__ == '__main__':
        if len(sys.argv) < 2:
	        print"Please enter bt_uart."
                exit(0)
       	x = sys.argv[1]
	uart_init(x)
	usart_receive_and_send()
