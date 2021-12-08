#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/mathewmilena/multifloor_astar/src/navigation/base_local_planner"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/mathewmilena/multifloor_astar/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/mathewmilena/multifloor_astar/install/lib/python2.7/dist-packages:/home/mathewmilena/multifloor_astar/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/mathewmilena/multifloor_astar/build" \
    "/usr/bin/python2" \
    "/home/mathewmilena/multifloor_astar/src/navigation/base_local_planner/setup.py" \
     \
    build --build-base "/home/mathewmilena/multifloor_astar/build/navigation/base_local_planner" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/mathewmilena/multifloor_astar/install" --install-scripts="/home/mathewmilena/multifloor_astar/install/bin"
