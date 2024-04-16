# aprs-igate

The aprs-igate role provides two method for running an igate. The first is a listen-only igate that relies on an SDR. The other provides a TX igate.

## services

### sdr-aprs

sdr-aprs is a service that listens to APRS on 144.390 via an rtl-sdr device with rtl-fm and sends the output to a socket. Disabled by default.

### sdr-igate

sdr-igate is a listen only igate that works with an SDR device. It listens for its data on the socket that sdr-aprs outputs to. Disabled by default.

### igate

igate is a TX igate that works with a physical radio. Enabled by default.

## Direwolf

Configuring Direwolf can be relatively challenging, especially when working with hardware for the soundcard and a physical radio. There are two primary tasks: configuring PTT and configuring the soundcard. In both cases, the Direwolf user guide is very useful and readers should take its advice.
k
Configuring PTT is relatively straightforward once it is known which device is the PTT device. I'm using an Easy Digi USB device purchased from e-bay for my Yaesu FT-2980 at /dev/ttyUSB0.

It's easiest if the soundcard has the same address every time. See the [usb-audio](../usb-audio) role for details about how to do that.

I'm using a [Syba external sound card](https://www.amazon.com/gp/product/B001MSS6CS/) to provide both input and output functions. Audio levels need to be configured in `alsamixer`. To figure out which devices need to be configured in `alsamixer`, use `arecord -l` and `aplay -l`, making note of which device the soundcard is.

Adjusting the input and output level is easiest when you have another APRS capable device (e.g. I use my Yaesu FT-3DR) on hand to test sending and receiving.

Run `alsamixer` and then select the appropriate device. Adjust both the volume on the radio and the input volume on the device in `alsamixer` to a reasonable level. When you believe the input level is set correctly, send an APRS beacon to the igate by specifying the igate's call sign as the digipath. Direwolf will output a message to its logs if the level is too high. Adjust the input level and try again if Direwolf logs indicate the level is too high or if Direwolf logs do not indicate that the beacon was received. Next, adjust the output levels and make sure your device receives the APRS message.
