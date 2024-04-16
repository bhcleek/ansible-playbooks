# ansible-playbooks

The ansible playbooks here are mostly for my own benefit, but others may find the roles useful. Some roles are intended to work on both macOS and Linux. Some are intended just for Linux.

# roles

Most roles have their own README.md. See the respective roles for more details about how the roles work and configuration information.

## [aprs-igate](./roles/aprs-igate)

Configure an APRS iGate.

## [base](./roles/base)

Common configurations that I want on all machines.

## [developer](./roles/developer)

You probably don't want this. It's just how I like to have my development machines configured. There are probably generally useful bits in here; the packages I install (Go, protoc, npm, node, vim, etc.), useful git configurations, tmux, and a bunch more. Take a look, maybe you'll find something here that you want, too 🤷.

## [educator](./roles/educator)

Useful stuff for learning. Just Kolibri for now. Kiwix is coming, too.

## [file-server](./roles/file-server)

Installs samba and configures shares.

## [flight-tracker](./roles/flight-tracker)

Configure a PiAware ADS-B receiver.

## [gpg-user](./roles/gpg-user)

Installs and configures gnupg.

## [ham](./roles/ham)

Ham radio bits.

## [media-server](./roles/media-server)

Install [Jellyfin](https://jellyfin.org/).

## [pi](./roles/pi)

Configure a raspberry pi after initial installation. Applies [Raspberry Pi's security recommendations](https://www.raspberrypi.org/documentation/configuration/security.md).

The users to configure are provided in `pi_users`, a list of dictionaries. `username` is the only required property on each value in the list. See [group_vars/pi/vars.yml](group_vars/pi/vars.yml) for examples.

## [pitft](./roles/pitft)

Configure a PiTFT screen.

## [radio](./roles/radio)

Configure general radio stuff. Right now it's just direwolf.

## [usb-audio](./roles/usb-audio)

Configure a USB sound card.
