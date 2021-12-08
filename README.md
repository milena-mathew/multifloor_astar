Not all packages included in src/ may be necessary but they're extremely old and interdependent so I haven't figured out what's needed for what.

Launching multifloor pipeline:
roscore
(The following tf transforms probably aren't quite right)
roslaunch a1_config bringup.launch
rosrun tf static_transform_publisher 0.0 0.0 0.0 0.0 0.0 0.0 base_link map 1000
rosrun tf static_transform_publisher 0.0 0.0 0.0 0.0 0.0 0.0 om base_link 1000
python multifloor.py (in astar_guidedog/scripts)
rosrun multi_map_navigation multi_map_navigation_test 0.6 1.75 house (these params are adjustable somewhat)

Param files are two_floors.yaml, floor_1.yaml, floor_2.yaml, (and launch files with the same names), and config files in stage_multi_map_navigation but I'm not 100% sure how to safely modify the config files.

There are methods for dealing with multiple elevators and transition action, but I've currently disabled this for debugging stuff.

Note these steps are not necessarily in the right order :(
