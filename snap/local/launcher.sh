#!/usr/bin/bash -e

SENSOR_HOSTNAME="$(snapctl get sensor-hostname)"
if [ ! -n "$SENSOR_HOSTNAME" ]; then
    logger -t ${SNAP_NAME} "Hostname is not set, please run: snap set $SNAP_NAME sensor-hostname <value>"
    exit 1
else
    logger -t ${SNAP_NAME} "Connecting to the sensor at hostname: '${SENSOR_HOSTNAME}'"
fi

IN_PARAMS_FILE="$(snapctl get config)"

OUT_PARAMS_FILE=/tmp/driver_params.yaml
sed "s|sensor_hostname: ''|sensor_hostname: ${SENSOR_HOSTNAME}|" $IN_PARAMS_FILE > $OUT_PARAMS_FILE

ros2 launch ouster_ros driver.launch.py params_file:=$OUT_PARAMS_FILE viz:=false
