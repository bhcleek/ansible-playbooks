# Finding the USB device path

1. run `udevadm monitor`
2. Plugin the device (it's ok to unplug it first).
3. Look for the add events. They'll contain the path of the device when it's plugged in.

`udevadm info -p SYS_DEVICE_PATH --attribute-walk` will give you a lot of information about the device that can be used to construct udev match rules.
