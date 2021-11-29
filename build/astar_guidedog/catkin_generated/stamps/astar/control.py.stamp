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
from std_msgs.msg import Float32MultiArray,Float32,Int16
curr_state=np.zeros(5)
desired_path=[ np.zeros([300,3]) , 0]
desired_global_path=[ np.zeros([200,5]) , 0]


tune_set=[[0.15,0,0],[-0.15,0,0],[0.15,0,0.3],[0.15,0,-0.3],[0.1,0,0.4],[0.1,0,-0.4],[-0.15,0,0.2],[-0.15,0,-0.2],[0,0,0.4],[0,0,-0.4],[0,0,0],[0.1,0.05,0],[0.1,-0.05,0]]

# tune_set=[[0.15,0],[-0.15,0],[0,0.2],[0,-0.2],[0.1,0.3],[0.1,-0.3],[0.1,0.4],[0.1,-0.4],[-0.15,0.2],[-0.15,-0.2],[0,0]]
control_cmd = Twist()
lc = lcm.LCM()

control_mode = 0 # 0 for manual 1 for auto 

def distance(c1,c2):
    theta_d= math.pi - abs((c1[2]-c2[2])%(2*math.pi)-math.pi)
    distance = np.sqrt((c1[0]-c2[0])*(c1[0]-c2[0])+(c1[1]-c2[1])*(c1[1]-c2[1])+0.01*theta_d*theta_d)
    return distance

def distance_global(c1,c2):
    theta_d= math.pi - abs((c1[2]-c2[2])%(2*math.pi)-math.pi)
    phi_d= math.pi - abs((c1[3]-c2[3])%(2*math.pi)-math.pi)
    distance = np.sqrt((c1[0]-c2[0])*(c1[0]-c2[0])+(c1[1]-c2[1])*(c1[1]-c2[1])+0.01*theta_d*theta_d+0.01*phi_d*phi_d)
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



def human_cheetah_dynamic_model(p,action): 
    """
    p0: dog x  
    p1: dog y  
    p2: dog theta  
    p3: phi  
    p4: distance_v  
    a0: vx  
    a1: vy  
    a2: w
    """
    global L
    global dt
    L = 0.85
    dt = 0.1
    next_p2= p[2]+dt*action[2]*0.6
    next_p0= p[0]+dt*np.cos(next_p2)*action[0]*0.8 - dt*np.sin(next_p2)*action[1]
    next_p1= p[1]+dt*np.sin(next_p2)*action[0]*0.8 +  dt*np.cos(next_p2)*action[1]
    next_p3= p[3] - np.arcsin( ( np.sqrt(action[0]*action[0] )*dt * np.sin( (p[3]) )/L ) ) 
    # next_p3= p[3]+ np.arcsin( (np.sqrt(action[0]*action[0] + action[1]*action[1])*0.1)*np.sin( (p[3]+ np.pi/2 + np.arctan(action[0]/action[1]))/L ) )
    next_p=np.array([next_p0,next_p1,next_p2,next_p3,p[4] ] ) 
    return next_p,action


def dist_all( times,p):
    distall = 0
    for i in range(5):
        distall = distall + distance(desired_path[0][times+i],p)
    return distall

def cost( possible_tune, goal, times):
    return np.array([distance_global(goal,p[0]) for p in possible_tune])    

def step_control(target_position, next_target_position, open_loop_input,times):
    pre_close_loop_input=np.zeros(2)
    # pre_close_loop_input[0] = open_loop_input[0]  
    # pre_close_loop_input[1] =   open_loop_input[1] 
    pre_close_loop_input[0] = 0  
    pre_close_loop_input[1] =  0
    possible_tune = [dynamic_model(curr_state,np.array([pre_close_loop_input[0]+tune[0],pre_close_loop_input[1]+tune[1]])) for tune in tune_set]
    next_p,close_loop_input= possible_tune[np.argmin(cost(possible_tune,next_target_position,times))]
    cmd(close_loop_input)

def step_global_control(target_position, next_target_position,times):
    pre_close_loop_input=np.zeros(3)
    # pre_close_loop_input[0] = open_loop_input[0]  
    # pre_close_loop_input[1] =   open_loop_input[1] 
    pre_close_loop_input[0] = 0  
    pre_close_loop_input[2] =  0
    possible_tune = [human_cheetah_dynamic_model(curr_state,np.array([pre_close_loop_input[0]+tune[0],0+tune[1],pre_close_loop_input[2]+tune[2]])) for tune in tune_set]
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

    number =  np.argmin( np.array([distance_global(c1,desired_global_path[0][i]) for i in range(desired_global_path[1])]) )
    return number

def global_path_callback(data):
    size = len(data.data)/5
    print(size)
    desired_global_path[1]=size
    for i in range(size):
        desired_global_path[0][i,0]=data.data[0+5*i]
        desired_global_path[0][i,1]=data.data[1+5*i]
        desired_global_path[0][i,2]=data.data[2+5*i]
        desired_global_path[0][i,3]=data.data[3+5*i]
        desired_global_path[0][i,4]=data.data[4+5*i]


def angle_callback(data):
    curr_state[3] = float( 90 - data.data) * np.pi/180

def distance_callback(data):
    curr_state[4] = data.data

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
    while (desired_global_path[1] == 0) and (not rospy.is_shutdown()) :
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
        desired_state = desired_global_path[0][times]
        next_desired_state = desired_global_path[0][times+1]
        # command = np.array([ linear_speed(next_desired_state, desired_state) , angular_speed(next_desired_state, desired_state) ]) 
        
        step_global_control(desired_state, next_desired_state ,times)
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
    # rospy.Subscriber('gazebo/model_states',ModelStates,loc_callback)
    rospy.Subscriber('nav_path',Path,path_callback)
    rospy.Subscriber('human_ang',Int16,angle_callback)
    rospy.Subscriber('distance',Float32,distance_callback)
    rospy.Subscriber('global_path',Float32MultiArray,global_path_callback)

    pub = rospy.Publisher('/cmd_vel',Twist,queue_size=10)
    size = 0
    listener = tf.TransformListener()

    
    if( control_mode == 1):
        auto()
    else:
        manual()