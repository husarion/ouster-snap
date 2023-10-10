# ouster-snap

> **Note**
> This is an unofficial snap provided by Husarion

This snap packages the [`ouster-ros`](https://github.com/ouster-lidar/ouster-ros/tree/ros2) package.
It thus conveniently offers all the ROS 2 stack necessary to bring up the [Ouster sensors](https://ouster.com/).

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/ouster-ros)

## Installation

Install the snap as follows,

```bash
snap install ouster-ros
```

## Setup

Upon installation, depending on your operating system,
you may have to manually connect the snap interface.
You can verify that with the following command,

```bash
$ snap connections ouster-ros
Interface            Plug                     Slot                            Notes
content[ros-humble]  ouster-ros:ros-humble    ros-humble-ros-base:ros-humble  manual
network              ouster-ros:network       :network                        -
network-bind         ouster-ros:network-bind  :network-bind                   -
```

The interface `ros-humble` must be connected.

If it isn't, you can issue the following command,

```bash
snap connect ouster-ros:ros-humble ros-humble-ros-base
```

## Use

## Start

This application runs as a daemon.
To start it, connect the `ros-humble` interface if it isn't already and set the `sensor-hostname` variable as shown below.
Next launch it as follows.
```bash
snap start ouster-ros
```

If you want to rest the `$SNAP_COMMON/config/driver_params.yaml` file do it with following command.
```bash
ouster-ros.reset-config 
```


### Parameters

Depending on the behaviour you expect from the sensor you can change the configuration.
The most important parameter is `sensor-hostname`. It tells the driver where to look for the LIDAR to connect. Note it will always overwrite the hostname set in the parameters and is obligatory parameter. 

```bash
snap set ouster-ros sensor-hostname=192.169.0.3
```

To configure the Ouster LIDAR to your needs you can pass a path to `driver_params.yaml` file of your choice.
```bash
snap set ouster-ros config=$SNAP_COMMON/config/driver_params.yaml
```