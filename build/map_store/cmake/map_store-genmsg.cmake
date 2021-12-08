# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "map_store: 1 messages, 6 services")

set(MSG_I_FLAGS "-Imap_store:/home/mathewmilena/multifloor_astar/src/map_store/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(map_store_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" ""
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" ""
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" ""
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" ""
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" ""
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" "map_store/MapListEntry"
)

get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_custom_target(_map_store_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "map_store" "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)

### Generating Services
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)
_generate_srv_cpp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
)

### Generating Module File
_generate_module_cpp(map_store
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(map_store_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(map_store_generate_messages map_store_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_cpp _map_store_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_store_gencpp)
add_dependencies(map_store_gencpp map_store_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)

### Generating Services
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)
_generate_srv_eus(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
)

### Generating Module File
_generate_module_eus(map_store
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(map_store_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(map_store_generate_messages map_store_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_eus _map_store_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_store_geneus)
add_dependencies(map_store_geneus map_store_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)

### Generating Services
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)
_generate_srv_lisp(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
)

### Generating Module File
_generate_module_lisp(map_store
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(map_store_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(map_store_generate_messages map_store_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_lisp _map_store_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_store_genlisp)
add_dependencies(map_store_genlisp map_store_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)

### Generating Services
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)
_generate_srv_nodejs(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
)

### Generating Module File
_generate_module_nodejs(map_store
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(map_store_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(map_store_generate_messages map_store_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_nodejs _map_store_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_store_gennodejs)
add_dependencies(map_store_gennodejs map_store_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)

### Generating Services
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv"
  "${MSG_I_FLAGS}"
  "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)
_generate_srv_py(map_store
  "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
)

### Generating Module File
_generate_module_py(map_store
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(map_store_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(map_store_generate_messages map_store_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SaveMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/PublishMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/msg/MapListEntry.msg" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/RenameMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/SetOrigin.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/ListMaps.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mathewmilena/multifloor_astar/src/map_store/srv/DeleteMap.srv" NAME_WE)
add_dependencies(map_store_generate_messages_py _map_store_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(map_store_genpy)
add_dependencies(map_store_genpy map_store_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS map_store_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/map_store
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(map_store_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/map_store
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(map_store_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/map_store
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(map_store_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/map_store
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(map_store_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/map_store
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(map_store_generate_messages_py std_msgs_generate_messages_py)
endif()
