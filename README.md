# ansible-playbooks

The ansible playbooks here are mostly for my own benefit, but others may find the roles useful. Some roles are intended to work on both macOS and Linux. Some are intended just for Linux.

# roles

## aprs-igate

Configure an APRS iGate.

## base

Common configurations that I want on all machines.

## developer

You probably don't want this. It's just how I like to have my development machines configured. There are probably generally useful bits in here; the packages I install (Go, protoc, npm, node, vim, etc.), useful git configurations, tmux, and a bunch more. Take a look, maybe you'll find something here that you want, too 🤷.

## educator

Useful stuff for learning. Just Kolibri for now. Kiwix is coming, too.

## file-server

Installs samba and configures shares.

## flight-tracker

Configure a PiAware ADS-B receiver.

## gpg-user

Installs and configures gnupg.

## ham

Ham radio bits.

## media-server

Install [Jellyfin](https://jellyfin.org/).

## pi

Configure a raspberry pi after initial installation. Applies [Raspberry Pi's security recommendations](https://www.raspberrypi.org/documentation/configuration/security.md).

The users to configure are provided in `pi_users`, a list of dictionaries. `username` is the only required property on each value in the list. See [group_vars/pi/vars.yml](group_vars/pi/vars.yml) for examples.

## pitft

Configure a PiTFT screen.

## radio

Configure general radio stuff. Right now it's just direwolf.

## usb-audio

Configure a USB sound card.
