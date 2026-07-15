# ros2gobot_base

`ros2gobot_base` is a ROS 2 hardware interface for ROS2GO differential drive robots. It provides seamless integration with `ros2_control` and includes a device-based licensing system to protect commercial deployments.

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
* ROS 2 JAZZY (or supported distribution)
* `ros2_control`
* A valid `license.key`

---

# Installation

## 1. Download the latest release

Download the latest package from the GitHub **Releases** page.

Example:

```bash
wget https://github.com/ros2gorobotics/ros2gobot-base-release/ros2gobot_base/releases/download/v1.0.0/ros2gobot_base_v1.0.0.tar.gz
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

# License Activation

`ros2gobot_base` is protected by a device-based license.

A valid `license.key` is required before the hardware interface can be initialized.

## Activate Your License

1. Register your device at **https://ros2go.io**
2. Download your `license.key`
3. Copy the file to

```text
license/license.key
```

4. Launch the robot.

---

# Usage

Launch your robot normally.

Example:

```bash
ros2 launch <your_package> <your_launch_file>.launch.py
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

  • license/license.key exists.
  • The license matches this device.

Register and obtain a license at:

https://ros2go.io

//////////////////////////////////////////////////////////////
```

---

# Troubleshooting

## License validation failed

License validation may fail if:

* `license/license.key` does not exist.
* The license file is corrupted.
* The license does not match the current device.
* The license has expired or has been revoked.

---

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

# Documentation

Complete documentation, tutorials, and examples are available at:

https://ros2go.io

---

# Support

For licensing, documentation, and updates, visit:

https://ros2go.io

---

# License

This software is proprietary commercial software.

Use of this software requires a valid license issued by ROS2GO.

Unauthorized copying, modification, redistribution, or reverse engineering is prohibited unless explicitly permitted by the license agreement.
