#!/bin/sh

Cancel=1
Reboot=2
Shutdown=3
Logout=4

xmessage "Exit Methods:" -center -title "Exit Methods" -default "Cancel" \
    -buttons "Cancel":$Cancel,"Reboot":$Reboot,"Shutdown":$Shutdown,"Logout":$Logout

case $? in
    $Cancel)
        echo "Exit Canceled by $USER [`date`]";;
    $Reboot)
        sudo reboot;;
    $Shutdown)
        sudo shutdown -h now;;
    $Logout)
        killall -u $USER;;
esac
