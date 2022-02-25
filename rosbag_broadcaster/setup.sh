#!/bin/bash -e

source /opt/ros/noetic/setup.bash
echo '. /opt/ros/noetic/setup.bash' >> $HOME/.bashrc
echo '. $HOME/catkin_ws/devel/setup.bash' >> $HOME/.bashrc

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src

PACKAGE_NAME="rosbag_broadcaster"
catkin_create_pkg $PACKAGE_NAME std_msgs rospy actionlib actionlib_msgs sensor_msgs
cd $PACKAGE_NAME
cp -r /app/launch .

# catkin make
cd ~/catkin_ws
catkin_make