//
// Created by anxing.
//
#include <iostream>
#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Path.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/Point.h>
#include <opencv2/opencv.hpp>
#include "Astar.h"
#include "OccMapTransform.h"
#include <gazebo_msgs/ModelStates.h>
#include <tf/tf.h>
#include "Point_3D.h"
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>

#include <std_msgs/Float32MultiArray.h>
using namespace cv;
using namespace std;


//-------------------------------- Global variables ---------------------------------//
// Subscriber
ros::Subscriber map_sub;
ros::Subscriber startPoint_sub;
ros::Subscriber startPoint_sub1;

ros::Subscriber targetPoint_sub;
// Publisher
ros::Publisher mask_pub;
ros::Publisher path_pub;

// Object
nav_msgs::OccupancyGrid OccGridMask;
nav_msgs::Path path;
pathplanning::AstarConfig config;
pathplanning::Astar astar;
OccupancyGridParam OccGridParam;
Point_3D startPoint, targetPoint;

Mat global_Map;
Mat global_Mask;
// Parameter
double InflateRadius;
bool map_flag;
bool startpoint_flag;
bool targetpoint_flag;
bool start_flag;
int rate;

//-------------------------------- Callback function ---------------------------------//
void MapCallback(const nav_msgs::OccupancyGrid& msg)
{
    // Get parameter
    OccGridParam.GetOccupancyGridParam(msg);

    // Get map
    int height = OccGridParam.height;
    int width = OccGridParam.width;
    int OccProb;
    Mat Map(height, width, CV_8UC1);
    for(int i=0;i<height;i++)
    {
        for(int j=0;j<width;j++)
        {
            OccProb = msg.data[i * width + j];
            OccProb = (OccProb < 0) ? 100 : OccProb; // set Unknown to 0
            // The origin of the OccGrid is on the bottom left corner of the map
            Map.at<uchar>(height-i-1, j) = 255 - round(OccProb * 255.0 / 100.0);
        }
    }

    // Initial Astar
    Mat Mask;
    config.InflateRadius = round(InflateRadius / OccGridParam.resolution);
    astar.InitAstar(Map, Mask, config);
    global_Map = Map;
    global_Mask = Mask;
    // Publish Mask
    OccGridMask.header.stamp = ros::Time::now();
    OccGridMask.header.frame_id = "map";
    OccGridMask.info = msg.info;
    for(int i=0;i<height;i++)
    {
        for(int j=0;j<width;j++)
        {
            OccProb = Mask.at<uchar>(height-i-1, j) * 255;
            OccGridMask.data.push_back(OccProb);
        }
    }

    // Set flag
    map_flag = true;
    startpoint_flag = false;
    targetpoint_flag = false;
}

void StartPointCallback(const gazebo_msgs::ModelStates& msg)
{
    cout<<msg.pose[2].position.x<<"  "<<msg.pose[2].position.y;
    Point_3D src_point(msg.pose[2].position.x, msg.pose[2].position.y);
    
//     cout<<msg.pose[2].position.x<<"  "<<msg.pose[2].position.y;


    OccGridParam.Map2ImageTransform(src_point, startPoint);
    double roll, pitch, yaw;
    geometry_msgs::Quaternion q = msg.pose[2].orientation;
    tf::Quaternion quat(q.x, q.y, q.z, q.w); // x, y, z, w
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw);
    startPoint.theta=yaw;
    // cout<<msg.pose[1].position.x;
    // Set flag
    startpoint_flag = true;
    if(map_flag && startpoint_flag && targetpoint_flag)
    {
        start_flag = true;
    }
}

void StartPointCallback_for_real_time(const geometry_msgs::PoseWithCovarianceStamped& msg)
{
    Point_3D src_point(msg.pose.pose.position.x, msg.pose.pose.position.y);
    OccGridParam.Map2ImageTransform(src_point, startPoint);
    
    double roll, pitch, yaw;
    geometry_msgs::Quaternion q = msg.pose.pose.orientation;
    tf::Quaternion quat(q.x, q.y, q.z, q.w); // x, y, z, w
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw);
    startPoint.theta=yaw;
    // cout<<msg.pose[1].position.x;
    // Set flag
    startpoint_flag = true;
    if(map_flag && startpoint_flag && targetpoint_flag)
    {
        start_flag = true;
    }

   ROS_INFO("startPoint: %f %f %f %f %f %f", msg.pose.pose.position.x, msg.pose.pose.position.y,
            startPoint.x, startPoint.y );
}

void StartPointCallback1(const geometry_msgs::PoseWithCovarianceStamped& msg)
{
    Point_3D src_point(msg.pose.pose.position.x, msg.pose.pose.position.y);
    OccGridParam.Map2ImageTransform(src_point, startPoint);
    
    double roll, pitch, yaw;
    geometry_msgs::Quaternion q = msg.pose.pose.orientation;
    tf::Quaternion quat(q.x, q.y, q.z, q.w); // x, y, z, w
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw);
    startPoint.theta=yaw;
    // cout<<msg.pose[1].position.x;
    // Set flag
    startpoint_flag = true;
    if(map_flag && startpoint_flag && targetpoint_flag)
    {
        start_flag = true;
    }

   ROS_INFO("startPoint: %f %f %f %f %f %f", msg.pose.pose.position.x, msg.pose.pose.position.y,
            startPoint.x, startPoint.y, startPoint.theta);
}

void TargetPointtCallback(const geometry_msgs::PoseStamped& msg)
{
    Point_3D src_point(msg.pose.position.x, msg.pose.position.y);
    OccGridParam.Map2ImageTransform(src_point, targetPoint);

    double roll, pitch, yaw;
    geometry_msgs::Quaternion q = msg.pose.orientation;
    tf::Quaternion quat(q.x, q.y, q.z, q.w); // x, y, z, w
    tf::Matrix3x3(quat).getRPY(roll, pitch, yaw);
    targetPoint.theta=yaw;

    // Set flag
    targetpoint_flag = true;
    if(map_flag && startpoint_flag && targetpoint_flag)
    {
        start_flag = true;
    }

//    ROS_INFO("targetPoint: %f %f %d %d", msg.pose.position.x, msg.pose.position.y,
//             targetPoint.x, targetPoint.y);
}

//-------------------------------- Main function ---------------------------------//
int main(int argc, char * argv[])
{
    //  Initial node
    ros::init(argc, argv, "astar");
    ros::NodeHandle nh;
    ros::NodeHandle nh_priv("~");
    ROS_INFO("Start astar node!\n");

    // Initial variables
    map_flag = false;
    startpoint_flag = false;
    targetpoint_flag = false;
    start_flag = false;

    // Parameter
    nh_priv.param<bool>("Euclidean", config.Euclidean, true);
    nh_priv.param<int>("OccupyThresh", config.OccupyThresh, -1);
    nh_priv.param<double>("InflateRadius", InflateRadius, -1);
    nh_priv.param<int>("rate", rate, 5);

    // Subscribe topics
    map_sub = nh.subscribe("map", 10, MapCallback);
    startPoint_sub1 = nh.subscribe("initialpose", 10, StartPointCallback1);
    // startPoint_sub = nh.subscribe("gazebo/model_states",1 , StartPointCallback);
    targetPoint_sub = nh.subscribe("move_base_simple/goal", 10, TargetPointtCallback);
    

    // Advertise topics
    mask_pub = nh.advertise<nav_msgs::OccupancyGrid>("mask", 1);
    path_pub = nh.advertise<nav_msgs::Path>("nav_path", 10);
    
    ros::Publisher global_pub = nh.advertise<std_msgs::Float32MultiArray>("global_path", 1);

    ros::Publisher marker_pub = nh.advertise<visualization_msgs::MarkerArray>("config_maker_array", 1);
    // ros::Publisher marker_people_pub = nh.advertise<visualization_msgs::MarkerArray>("config_maker_people_array", 1);
    // ros::Publisher marker_line_pub = nh.advertise<visualization_msgs::MarkerArray>("config_maker_line_array", 1);
    
    std_msgs::Float32MultiArray global_path;
    visualization_msgs::MarkerArray markerarray;
    // visualization_msgs::MarkerArray markerarray_people;
    // visualization_msgs::MarkerArray markerarray_line;
    visualization_msgs::Marker marker;
    // visualization_msgs::Marker marker_line;
    // visualization_msgs::Marker marker_people;
    int marker_id=0;

    // Loop and wait for callback
    ros::Rate loop_rate(rate);
    while(ros::ok())
    {
        if(start_flag)
        {
            int sequ = 0;
            // Start planning path
            vector<Point_3D> PathList;
            astar.PathPlanning(startPoint, targetPoint, PathList);
            // astar.DrawPath(global_Map, PathList, global_Mask);
            
            global_path.data.resize(PathList.size()*3);

            if(!PathList.empty())
            {
                
                
                path.header.stamp = ros::Time::now();
                path.header.frame_id = "map";
                path.poses.clear();

                
                markerarray.markers.clear();
                for(int i=0;i<PathList.size();i++)
                {
                    
                    Point_3D dst_point;
                    OccGridParam.Image2MapTransform(PathList[i], dst_point);
                    geometry_msgs::PoseStamped pose_stamped;
                    pose_stamped.header.seq = sequ;
                    sequ++;
                    pose_stamped.header.stamp = ros::Time::now();
                    pose_stamped.header.frame_id = "map";
                    // pose_stamped.pose.position.x = dst_point.x;
                    // pose_stamped.pose.position.y = dst_point.y;
                    pose_stamped.pose.position.x = dst_point.x ;
                    pose_stamped.pose.position.y = dst_point.y ;
                    pose_stamped.pose.orientation.w = dst_point.theta ;

                    global_path.data[i*3+0]=dst_point.x;
                    global_path.data[i*3+1]=dst_point.y;
                    global_path.data[i*3+2]=dst_point.theta;
                    // global_path.data[i*5+3]=dst_point.alpha;
                    // global_path.data[i*5+4]=1;
                    // pose_stamped.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0, 0, dst_point.theta );
//-------------------------------draw--------------------------------//
                    if (i%1 == 0){
                        // marker_people.header.stamp = ros::Time::now();
                        // marker_people.header.frame_id = "map";
                        // marker_people.id = marker_id;
                        // marker_people.type = visualization_msgs::Marker::CYLINDER;
                        // marker_people.pose.position.x=dst_point.x - (dst_point.length)*cos(dst_point.theta-dst_point.alpha);
                        // marker_people.pose.position.y=dst_point.y - (dst_point.length)*sin(dst_point.theta-dst_point.alpha);
 
                        // marker_people.pose.position.z=0;
                        // marker_people.pose.orientation=tf::createQuaternionMsgFromRollPitchYaw(0, 0, dst_point.theta );
                        // // marker.pose.orientation.x = 0.0;
                        // // marker.pose.orientation.y = 0.0;
                        // // marker.pose.orientation.z = 0.0;
                        // // marker.pose.orientation.w = 1.0;
                        // marker_people.scale.x = 0.4;
                        // marker_people.scale.y = 0.4;
                        // marker_people.scale.z = 1.5;
                        // marker_people.color.a= 1.0;
                        // marker_people.color.r = 0;
                        // marker_people.color.g=1;
                        // marker_people.color.b=0;


                        marker.header.stamp = ros::Time::now();
                        marker.header.frame_id = "map";
                        marker.id = marker_id;
                        marker.type = visualization_msgs::Marker::CUBE;
                        marker.pose.position.x=dst_point.x ;
                        marker.pose.position.y=dst_point.y ;
                        marker.pose.position.z=0.075;
                        marker.pose.orientation=tf::createQuaternionMsgFromRollPitchYaw(0, 0, dst_point.theta );
                        // marker.pose.orientation.x = 0.0;
                        // marker.pose.orientation.y = 0.0;
                        // marker.pose.orientation.z = 0.0;
                        // marker.pose.orientation.w = 1.0;
                        marker.scale.x = 0.4;
                        marker.scale.y = 0.2;
                        marker.scale.z = 0.15;
                        marker.color.a= 1.0;
                        marker.color.r = 0;
                        marker.color.g=1;
                        marker.color.b=0;


                        // marker_line.header.stamp = ros::Time::now();
                        // marker_line.header.frame_id = "map";
                        // marker_line.id = marker_id;
                        // marker_line.type=visualization_msgs::Marker::LINE_LIST;
                        // geometry_msgs::Point people_p;
                        geometry_msgs::Point dog_p;
                        // people_p.x=marker_people.pose.position.x;
                        // people_p.y=marker_people.pose.position.y;
                        // people_p.z=marker_people.pose.position.z;
                        dog_p.x=marker.pose.position.x;
                        dog_p.y=marker.pose.position.y;
                        dog_p.z=2*marker.pose.position.z;
                        // marker_line.scale.x=0.1;
                        // marker_line.points.push_back(people_p);
                        // marker_line.points.push_back(dog_p);
                        // marker_line.color.a= 1.0;
                        // marker_line.color.r = 0;
                        // marker_line.color.g=0;
                        // marker_line.color.b=1;
                        if (i == PathList.size()-1)
                        {
                            markerarray.markers.push_back(marker);
                            // markerarray_people.markers.push_back(marker_people);
                            // markerarray_line.markers.push_back(marker_line);         
                            // cout<<PathList[i].length<<endl;
                            marker_id++;
                        }
                        
                    }
                    
                    path.poses.push_back(pose_stamped);
                }
                ROS_INFO("%d",sequ);
                // path.header.seq = sequ;
                marker_id=0;
                path_pub.publish(path);
            
                marker_pub.publish(markerarray);
                // marker_line_pub.publish(markerarray_line);
                // marker_people_pub.publish(markerarray_people);

                global_pub.publish(global_path);

                ROS_INFO("Find a valid path successfully");
            }
            else
            {
                ROS_ERROR("Can not find a valid path");
            }

            // Set flag
            // start_flag = false;
        }

        if(map_flag)
        {
            mask_pub.publish(OccGridMask);
        }

        loop_rate.sleep();
        ros::spinOnce();
    }


    return 0;
}
