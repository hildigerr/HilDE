#!/bin/sh

Cancel=1
Reboot=2
Shutdown=3
Logout=4

xmessage "Exit Methods:" -center -title "Exit Methods" -default "Cancel" \
    -buttons "Cancel":$Cancel,"Reboot":$Reboot,"Shutdown":$Shutdown,"Logout":$Logout

case $? in
    1) #Cancel
        echo "Exit Canceled by $USER [`date`]";;
    2) #
        sudo reboot;;
    3) #
        sudo shutdown -h now;;
    4) #Logout
        killall -u $USER;;
esac
