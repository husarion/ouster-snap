#!/usr/bin/bash -e

export SENSOR_HOSTNAME="$(snapctl get sensor-hostname)"
if [ ! -n "$SENSOR_HOSTNAME" ]; then
    logger -t ${SNAP_NAME} "Hostname is not set, please run: snap set $SNAP_NAME sensor-hostname <value>"
    exit 1
else
    logger -t ${SNAP_NAME} "Connecting to the sensor at hostname: '${SENSOR_HOSTNAME}'"
fi


CONFIG="$(snapctl get config)"
if [ ! -n "$CONFIG" ]; then
    logger -t ${SNAP_NAME} "Config file is not set. Resorting to the default configuration."
fi

# replace the hostname and store the resulting file in temporary directory
IN_PARAMS_FILE=$SNAP_COMMON/config/driver_params.yaml
OUT_PARAMS_FILE=/tmp/driver_params.yaml
yq '.ouster/os_driver.ros__parameters.sensor_hostname = env(SENSOR_HOSTNAME)' $IN_PARAMS_FILE > $OUT_PARAMS_FILE

ros2 launch ouster_ros driver.launch.py params_file:=$OUT_PARAMS_FILE viz:=false
