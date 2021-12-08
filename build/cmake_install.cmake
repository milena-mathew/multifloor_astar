# Install script for directory: /home/mathewmilena/multifloor_astar/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mathewmilena/multifloor_astar/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE PROGRAM FILES "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE PROGRAM FILES "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/setup.bash;/home/mathewmilena/multifloor_astar/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE FILE FILES
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/setup.bash"
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/setup.sh;/home/mathewmilena/multifloor_astar/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE FILE FILES
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/setup.sh"
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/setup.zsh;/home/mathewmilena/multifloor_astar/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE FILE FILES
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/setup.zsh"
    "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mathewmilena/multifloor_astar/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/mathewmilena/multifloor_astar/install" TYPE FILE FILES "/home/mathewmilena/multifloor_astar/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mathewmilena/multifloor_astar/build/gtest/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/a1_config/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_bringup/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_config/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_description/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_navigation/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/Mini-Cheetah-ROS/cheetah_control/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/Mini-Cheetah-ROS/cheetah_show/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/navigation/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/Mini-Cheetah-ROS/reconfigure/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/multi_map_navigation_pr2_coffee/stage_multi_map_navigation/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_msgs/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/a1_description/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_gazebo/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/multi_map_navigation_pr2_coffee/multi_map_navigation/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/map_server/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/object_msgs/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/astar_guidedog/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/namespace_mux/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/amcl/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/fake_localization/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/champ/champ_base/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/voxel_grid/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/costmap_2d/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/nav_core/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/base_local_planner/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/carrot_planner/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/clear_costmap_recovery/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/dwa_local_planner/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/move_slow_and_clear/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/navfn/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/global_planner/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/rotate_recovery/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/navigation/move_base/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/warehouse_ros/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/map_store/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/robot_state_plugin/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/Mini-Cheetah-ROS/cheetah_description/cmake_install.cmake")
  include("/home/mathewmilena/multifloor_astar/build/yocs_velocity_smoother/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mathewmilena/multifloor_astar/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
