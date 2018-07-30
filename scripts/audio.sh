#!/bin/bash
EXTERNAL_OUTPUT="hdmi-stereo"
INTERNAL_OUTPUT="analog-stereo"

# if we don't have a file, start at zero
if [ ! -f "/tmp/audio_mode.dat" ] ; then
    audio_mode="INTERNAL"

# otherwise read the value from the file
else
    audio_mode=`cat /tmp/audio_mode.dat`
fi

if [ $audio_mode = "INTERNAL" ]; then
    audio_mode="EXTERNAL"
    pactl set-card-profile 0 output:$EXTERNAL_OUTPUT
else
    audio_mode="INTERNAL"
    pactl set-card-profile 0 output:$INTERNAL_OUTPUT
fi

echo "${audio_mode}" > /tmp/audio_mode.dat
