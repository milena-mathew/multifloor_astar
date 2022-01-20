#!/usr/bin/env python
import roslaunch

if __name__ == "__main__":
    uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
    roslaunch.configure_logging(uuid)

    cli_args1 = ["/home/mathewmilena/multifloor_astar/src/astar_guidedog/launch/floor_1.launch",'map_name:=map.yaml']
    cli_args2 = ["/home/mathewmilena/multifloor_astar/src/astar_guidedog/launch/floor_2.launch",'map_name:=house.yaml']
    cli_args3 = ["/home/mathewmilena/multifloor_astar/src/astar_guidedog/launch/two_floor.launch"]
    cli_args4 = ["/home/mathewmilena/multifloor_astar/src/a1_config/launch/bringup.launch"]
   
    roslaunch_file1 = roslaunch.rlutil.resolve_launch_arguments(cli_args1)[0]
    roslaunch_args1 = cli_args1[1:]

    roslaunch_file2 = roslaunch.rlutil.resolve_launch_arguments(cli_args2)[0]
    roslaunch_args2 = cli_args2[1:]

    roslaunch_file3 = roslaunch.rlutil.resolve_launch_arguments(cli_args3)[0]
    roslaunch_file4 = roslaunch.rlutil.resolve_launch_arguments(cli_args4)[0]

    launch_files = [(roslaunch_file1, roslaunch_args1), (roslaunch_file2, roslaunch_args2), roslaunch_file3, roslaunch_file4]
    parent = roslaunch.parent.ROSLaunchParent(uuid, launch_files)
    parent.start()
    parent.spin()
 