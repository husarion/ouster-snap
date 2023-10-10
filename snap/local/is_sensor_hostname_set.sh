#!/bin/bash -e

# Check that hostname is set
if [ ! -n "$(snapctl get sensor-hostname)" ]; then
    logger -t ${SNAP_NAME} "Hostname is not set, please run: snap set $SNAP_NAME sensor-hostname <value>"
    exit 1
fi
