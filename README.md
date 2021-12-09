Not all packages included in src/ may be necessary but they're extremely old and interdependent so I haven't figured out what's needed for what.

Launching multifloor pipeline:

roscore

python multifloor.py (in astar_guidedog/scripts)

rosrun multi_map_navigation multi_map_navigation_test 0.6 1.75 house (these params are adjustable somewhat)

Elevator must be on overlap between map floors. Some map names are hardcoded- adding additional flexibility is WIP
