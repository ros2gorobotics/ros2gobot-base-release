# License Activation

`ros2gobot_base` is protected by a device-based license.

A valid `license.key` file is required before the hardware interface can be initialized.

## Getting Started

1. Download and install `ros2gobot_base`.
2. Register your device at **https://ros2go.io**.
3. Obtain your `license.key`.
4. Copy the file to:

```text
license/license.key
```

5. Launch the robot normally.

## License Validation

During startup, `ros2gobot_base` automatically validates the installed license.

If the license is missing or invalid, hardware initialization will be aborted and an error similar to the following will be displayed:

```text
[ROS2GO.IO] LICENSE ERROR

Invalid or missing license.

Hardware initialization has been aborted.

Please verify that 'license/license.key' exists and is valid.

Register and obtain a license at:
https://ros2go.io
```

## Supported License Scenarios

License validation may fail if:

* `license/license.key` does not exist.
* The license file is corrupted.
* The license does not match the target device.
* The license has been revoked or is otherwise invalid.

## Need a License?

Visit **https://ros2go.io** to register your device and obtain a valid license.

For additional documentation, tutorials, and updates, please visit:

https://ros2go.io

