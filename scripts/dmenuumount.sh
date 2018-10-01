#!/bin/sh
# A dmenu prompt to unmount drives.
# Provides you with mounted partitions, select one to unmount.
# Drives mounted at /, /boot and /home will not be options to unmount.

unmountusb() {
	drives=$(lsblk -nrpo "name,type,size,mountpoint" | awk '$2=="part"&&$4!~/\/boot|\/home$|SWAP/&&length($4)>1{printf "%s (%s)\n",$4,$3}')
	[ -z "$drives" ] && exit
	chosen=$(echo "$drives" | dmenu -i -p "Unmount which drive?" | awk '{print $1}')
	[ -z "$chosen" ] && exit
	sudo umount "$chosen" && pgrep -x dunst && notify-send "$chosen unmounted."
	}

unmountandroid() { \
	chosen=$(awk '/simple-mtpfs/ {print $2}' /etc/mtab | dmenu -i -p "Unmount which device?")
	[ -z "$chosen" ] && exit
	fusermount -u "$chosen" && pgrep -x dunst && notify-send "$chosen unmounted."
	}

asktype() { \
	case $(printf "USB\\nAndroid" | dmenu -i -p "Unmount a USB drive or Android device?") in
		USB) unmountusb ;;
		Android) unmountandroid ;;
	esac
	}

if grep simple-mtpfs /etc/mtab; then
	asktype
else
	unmountusb
fi
