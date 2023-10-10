#!/bin/bash -e

# Make sure the folder exists
mkdir -p $SNAP_COMMON/config

# copy the default driver configuration from the isntalled ROS package
cp $SNAP/opt/ros/snap/share/ouster_ros/config/driver_params.yaml $SNAP_COMMON/config/
