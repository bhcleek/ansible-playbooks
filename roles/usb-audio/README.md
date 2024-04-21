# Finding the USB device path

1. run `udevadm monitor`
2. Plugin the device (it's ok to unplug it first).
3. Look for the add events. They'll contain the path of the device when it's plugged in.

# Using the USB device path

Set the `usb_audio_device` variable to the value of the sound card device path found. You may need to set the value of the `usb_audio_id` variable, too, but its default is likely correct.

`udevadm info -p SYS_DEVICE_PATH --attribute-walk` will give you a lot of information about the device that can be used to construct udev match rules.
