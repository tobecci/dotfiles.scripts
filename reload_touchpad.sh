#!/bin/bash

password=$(cat ./password.txt)

send_notification(){
    notify-send $1
}

reload_touchpad(){
    libinput-gestures-setup stop
    echo $password | sudo --stdin modprobe -r psmouse; sudo --stdin modprobe psmouse
    libinput-gestures-setup restart
    libinput-gestures-setup start
}

send_notification "reloading...."
# espeak-ng "Started"
reload_touchpad
# espeak-ng "Done"
send_notification "TOUCHPAD RELOADED"