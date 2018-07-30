#!/bin/sh

sudo rmmod iwldvm
sudo rmmod iwlwifi
sudo modprobe iwlwifi
sudo systemctl restart NetworkManager
