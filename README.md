# ros2gobot_base

`ros2gobot_base` is a ROS 2 hardware interface for ROS2GO differential drive robots. It provides seamless integration with `ros2_control` and includes a device-based licensing system for commercial deployments.

---

# Features

* ROS 2 Hardware Interface (`ros2_control`)
* Differential Drive Support
* Wheel Encoder Support
* IMU Integration
* Odometry
* Hardware Diagnostics
* Device-based License Protection

---

# Requirements

* Ubuntu 24.04
* ROS 2 Humble, Jazzy, Kilted, or a supported distribution
* `ros2_control`
* A valid `license.key`

---

# Installation

## 1. Download the latest release

Download the latest package from the GitHub **Releases** page.

Example:

```bash
wget https://github.com/ros2gorobotics/ros2gobot-base-release/releases/download/v1.0.0/ros2gobot_base_v1.0.0.tar.gz
```

---

## 2. Install the package

```bash
sudo mkdir -p /opt/ros2go/software

sudo tar -xzvf ros2gobot_base_v1.0.0.tar.gz \
    -C /opt/ros2go/software/
```

---

## 3. Register the shared library

```bash
sudo sh -c 'echo "/opt/ros2go/software/ros2gobot_base/lib" > /etc/ld.so.conf.d/ros2go.conf'

sudo ldconfig
```

---

## 4. Verify the installation

```bash
ldconfig -p | grep ros2gobot_base
```

If no errors are reported, the installation has completed successfully.

---

# Environment Setup

To automatically configure the ROS 2 environment for all users, create the following profile script.

## 1. Create the profile script

```bash
sudo nano /etc/profile.d/ros2gobot_base.sh
```

Add the following content:

```bash
#!/bin/bash

# Source ROS 2
source /opt/ros/humble/setup.bash

# Source ros2gobot_base
source /opt/ros2go/software/ros2gobot_base/local_setup.bash
```

> **Note**
>
> Replace `humble` with your installed ROS 2 distribution if you are using another version such as `jazzy` or `kilted`.

---

## 2. Set file permissions

```bash
sudo chmod 644 /etc/profile.d/ros2gobot_base.sh
```

---

## 3. Apply the environment

Open a new terminal, or run:

```bash
source /etc/profile.d/ros2gobot_base.sh
```

---

## 4. Verify

```bash
echo $AMENT_PREFIX_PATH
```

or

```bash
printenv | grep AMENT
```

The output should contain:

```text
/opt/ros2go/software/ros2gobot_base
```

---

# License Activation

`ros2gobot_base` is protected by a device-based license.

A valid `license.key` is required before the hardware interface can be initialized.

## Activate Your License

1. Register your device at **https://ros2go.io**
2. Download your `license.key`.
3. Create the license directory:

```bash
sudo mkdir -p /opt/ros2go/license
```

4. Copy the license file:

```bash
sudo cp license.key /opt/ros2go/license/license.key
```

5. Set the file permissions:

```bash
sudo chmod 644 /opt/ros2go/license/license.key
```

6. Launch the robot.

---

# Usage

Launch your robot normally.

Example:

```bash
ros2 launch ros2gobot_bringup ros2gobot_robot.launch.py
```

---

# License Validation

During startup, `ros2gobot_base` automatically validates the installed license.

If the license is missing or invalid, hardware initialization will be aborted and an error similar to the following will be displayed.

```text
//////////////////////////////////////////////////////////////

[ROS2GO.IO] LICENSE ERROR

Invalid or missing license.

Hardware initialization has been aborted.

Please verify that:

  • /opt/ros2go/license/license.key exists.
  • The license matches this device.

Register and obtain a license at:

https://ros2go.io

//////////////////////////////////////////////////////////////
```

---

# Troubleshooting

## Shared library not found

Run:

```bash
sudo ldconfig
```

Then verify:

```bash
ldconfig -p | grep ros2gobot_base
```

---

## License validation failed

License validation may fail if:

* `/opt/ros2go/license/license.key` does not exist.
* The license file is corrupted.
* The license does not match the current device.
* The license has expired or has been revoked.

---

# Directory Layout

```text
/opt/ros2go/
├── software/
│   └── ros2gobot_base/
├── license/
│   └── license.key
├── config/
└── logs/
```

---

# Documentation

Complete documentation, tutorials, examples, and installation guides are available at:

**https://ros2go.io**

---

# Support

For licensing, documentation, software updates, and technical support, visit:

**https://ros2go.io**

---

# License

Copyright © ROS2GO.

This software is proprietary commercial software.

A valid license issued by ROS2GO is required to use this software.

Unauthorized copying, modification, redistribution, reverse engineering, or commercial use is prohibited unless explicitly permitted by the applicable license agreement.
