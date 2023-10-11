# ouster-ros

> **Note**
> This is an unofficial snap provided by Husarion

This snap packages the [`ouster-ros`](https://github.com/ouster-lidar/ouster-ros/tree/ros2) package.
It thus conveniently offers all the ROS 2 stack necessary to bring up the [Ouster sensors](https://ouster.com/).

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/husarion-ouster-ros2)

## Installation

Install the snap as follows,

```bash
snap install husarion-ouster-ros2
```

## Setup

Upon installation, depending on your operating system,
you may have to manually connect the snap interface.
You can verify that with the following command,

```bash
$ snap connections husarion-ouster-ros2
Interface            Plug                     Slot                            Notes
content[ros-humble]  husarion-ouster-ros2:ros-humble    ros-humble-ros-base:ros-humble  manual
network              husarion-ouster-ros2:network       :network                        -
network-bind         husarion-ouster-ros2:network-bind  :network-bind                   -
```

The interface `ros-humble` must be connected.

If it isn't, you can issue the following command,

```bash
snap connect husarion-ouster-ros2:ros-humble ros-humble-ros-base
```


This application runs as a daemon. To start it, connect the `ros-humble` interface if it isn't already and set the `sensor-hostname` variable as shown below. After doing so it will start automatically.

The configuration file is readily available at `$SNAP_COMMON/config/driver_params.yaml`.
If you want to reset it, do it with following command,
```bash
husarion-ouster-ros2.reset-config 
```

### Parameters

Depending on the behaviour you expect from the sensor you can change the configuration.
The most important parameter is `sensor-hostname`. It tells the driver where to look for the LIDAR to connect. Note it will always overwrite the hostname set in the parameters and is obligatory parameter. 

```bash
snap set husarion-ouster-ros2 sensor-hostname=192.169.0.3
```

To configure the Ouster LIDAR to your needs you can pass a path to `driver_params.yaml` file of your choice.
```bash
snap set husarion-ouster-ros2 config=$SNAP_COMMON/config/driver_params.yaml
```
