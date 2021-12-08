cmake_minimum_required(VERSION 2.8.3)
project(multi_map_navigation)

# Load catkin and all dependencies required for this package
find_package(catkin REQUIRED COMPONENTS rospy message_generation std_msgs geometry_msgs actionlib_msgs)

add_service_files(DIRECTORY srv
                      FILES SetMap.srv
                 )

add_action_files(DIRECTORY action
                     FILES MultiMapNavigation.action
                           MultiMapNavigationTransition.action
                )
                
## Generate added messages and services with any dependencies listed here
generate_messages(DEPENDENCIES std_msgs geometry_msgs actionlib_msgs)

catkin_package()
include_directories(${catkin_INCLUDE_DIRS})
