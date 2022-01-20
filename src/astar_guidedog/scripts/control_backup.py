#!/usr/bin/env python
import numpy as np 
import sys
import rospy
import tf
import math
import matplotlib.pyplot as plt
import lcm
import sys, select, os
if os.name == 'nt':
    import msvcrt
else:
    import tty, termios
if os.name != 'nt':
    settings = termios.tcgetattr(sys.stdin)
from cmd_pack import cmd_lcm
from cmd_lcm2 import cmd_lcm2
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Twist
from nav_msgs.msg import Path
curr_state=np.zeros(3)
desired_path=[ np.zeros([300,3]) , 0]
tune_set=[[0.15,0],[-0.15,0],[0,0.2],[0,-0.2],[0.1,0.3],[0.1,-0.3],[0.1,0.4],[0.1,-0.4],[-0.15,0.2],[-0.15,-0.2],[0,0]]
control_cmd = Twist()
lc = lcm.LCM()

control_mode = 0 # 0 for manual 1 for auto 

def distance(c1,c2):
    theta_d= math.pi - abs((c1[2]-c2[2])%(2*math.pi)-math.pi)
    distance = np.sqrt((c1[0]-c2[0])*(c1[0]-c2[0])+(c1[1]-c2[1])*(c1[1]-c2[1])+0.01*theta_d*theta_d)
    return distance

def linear_speed(c1,c2):
    theta_d= math.pi - abs((c1[2]-c2[2])%(2*math.pi)-math.pi)
    distance = (np.sqrt((c1[0]-c2[0])*(c1[0]-c2[0])+(c1[1]-c2[1])*(c1[1]-c2[1]) )   ) / 0.5
    return distance

def angular_speed(c1,c2):
    distance = (c2[2]-c1[2]) /0.5
    return distance

def cmd(data):
    control_cmd.linear.x = data[0]
    control_cmd.linear.y = data[1]
    control_cmd.angular.z=data[2]
    print(data)
    pub.publish(control_cmd)
    msg = cmd_lcm2()
    msg.linear[0] = data[0]
    msg.linear[1] = data[1]
    msg.angular = data[2]
    lc.publish("cmd",msg.encode())
    
def dynamic_model(p,action):
    next_p2= p[2]+0.1*action[1]
    next_p0= p[0]+0.1*np.cos(next_p2)*action[0]
    next_p1= p[1]+0.1*np.sin(next_p2)*action[0]
    next_p=np.array([next_p0,next_p1,next_p2] ) 
    return next_p,action

# def human_cheetah_dynamic_model(p,action): # p0:dog x  p1:dog y  p2:dog theta  p3:phi  p4:distance  a0:vx  a1:vy  a2:w
#     L = 1
#     next_p2= p[2]+0.1*action[2]
#     next_p0= p[0]+0.1*np.cos(next_p2)*action[0] - 0.1*np.sin(next_p2)*action[1]
#     next_p1= p[1]+0.1*np.sin(next_p2)*action[0] +  0.1*np.cos(next_p2)*action[1]
#     next_p3= np.arccos( ( -action[1]*0.1 + (L-action[0]*np.cos(p[3])+action[1]*np.sin(p[3]) )*np.cos(p[3]) ) / L  )

#     next_p=np.array([next_p0,next_p1,next_p2,next_p3,p[4]] ) 
#     return next_p

def dist_all( times,p):
    distall = 0
    for i in range(5):
        distall = distall + distance(desired_path[0][times+i],p)
    return distall

def cost( possible_tune, goal, times):
    return np.array([distance(goal,p[0]) for p in possible_tune])    

def step_control(target_position, next_target_position, open_loop_input,times):
    pre_close_loop_input=np.zeros(2)
    # pre_close_loop_input[0] = open_loop_input[0]  
    # pre_close_loop_input[1] =   open_loop_input[1] 
    pre_close_loop_input[0] = 0  
    pre_close_loop_input[1] =  0
    possible_tune = [dynamic_model(curr_state,np.array([pre_close_loop_input[0]+tune[0],pre_close_loop_input[1]+tune[1]])) for tune in tune_set]
    next_p,close_loop_input= possible_tune[np.argmin(cost(possible_tune,next_target_position,times))]
    cmd(close_loop_input)


def quart_to_rpy(x,y,z,w):

    r = math.atan2(2*(w*x+y*z),1-2*(x*x+y*y))
    p = math.asin(2*(w*y-z*x))
    y = math.atan2(2*(w*z+x*y),1-2*(z*z+y*y))
    return y

def loc_callback(data):
    yaw = quart_to_rpy(data.pose[2].orientation.x,data.pose[2].orientation.y,data.pose[2].orientation.z,data.pose[2].orientation.w)
    curr_state[0]=data.pose[2].position.x
    curr_state[1]=data.pose[2].position.y
    curr_state[2]=yaw+np.pi
    # print(curr_state)

# def i_path(p,size):
#     for i in range(size):
#         desired_path[0][]

def find_min_distance(c1):

    number =  np.argmin( np.array([distance(c1,desired_path[0][i]) for i in range(desired_path[1])]) )
    return number

def path_callback(data):
    size = len(data.poses)
    # print(size)
    desired_path[1]=size
    for i in range(size):
        desired_path[0][i,0]=data.poses[i].pose.position.x
        desired_path[0][i,1]=data.poses[i].pose.position.y
        desired_path[0][i,2]=data.poses[i].pose.orientation.w

def auto():
    

    

    times =0
    rate = rospy.Rate(30)
    while (desired_path[1] == 0) and (not rospy.is_shutdown()) :
        print("not find path")
    
    
    while not rospy.is_shutdown():
        
        try:
        # listener.waitForTransform('/base_link','/map',rospy.Time(), rospy.Duration(4.0))
            (trans,rot) = listener.lookupTransform('map', 'base_link', rospy.Time(0))
            curr_state[0]=trans[0]
            curr_state[1]=trans[1]
            curr_state[2]=quart_to_rpy(rot[0],rot[1],rot[2],rot[3])
            print(curr_state[0],curr_state[1],curr_state[2])
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            pass
            
        times=find_min_distance(curr_state)

        if times > desired_path[1]-1:
            break
        desired_state = desired_path[0][times]
        next_desired_state = desired_path[0][times+1]
        command = np.array([ linear_speed(next_desired_state, desired_state) , angular_speed(next_desired_state, desired_state) ]) 
        
        step_control(desired_state, next_desired_state , command,times)
        rate.sleep()
        # times = times + 1


def getKey():
    if os.name == 'nt':
      return msvcrt.getch()

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

def manual():
    rate = rospy.Rate(100)
    data = np.array([ 0.0, 0.0, 0.0])
    while not rospy.is_shutdown():
        key = getKey()
        if key == 'w':
            if(data[0]< 0.35):
                data[0] = data[0] + 0.05
            else:
                data = data
        elif key == 'x':
            if(data[0]> -0.35):
                data[0] = data[0] - 0.05
            else: 
                data = data
        elif key == 'a':
            if(data[2]< 0.6):
                data[2] += 0.2
            else:
                data = data
        elif key == 'd':
            if(data[2]> -0.6):
                data[2] -= 0.2
            else:
                data = data
        elif key == 's':
            data = np.array([ 0.0,   0.0, 0.0])
        elif key == 'j':
            if(data[1]< 0.2):
                data[1] += 0.05
            else:
                data = data
        elif key == 'k':
            if(data[1]> -0.2):
                data[1] -= 0.05
            else:
                data = data
        
        elif (key == '\x03'):
            break
        else:
            data = data
        cmd(data)
        rate.sleep()

if __name__=='__main__':
    
    rospy.init_node('control')
    rospy.Subscriber('gazebo/model_states',ModelStates,loc_callback)
    rospy.Subscriber('nav_path',Path,path_callback)
    pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
    size = 0
    listener = tf.TransformListener()

    
    if( control_mode == 1):
        auto()
    else:
        manual()