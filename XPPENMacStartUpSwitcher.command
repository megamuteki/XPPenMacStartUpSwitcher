#!/bin/sh

tput smul
tput bold
tput setaf 1
echo "***This is XPPenDriver StartUp Switcher***"

tput setaf 7
tput setab 4
echo "This is Engineering Use Only"
echo "This is Abolutely No Warranty"
echo ""

tput setaf 7
tput setab 1
echo "Will You Continue?"
echo ""

tput sgr0
tput setaf 5

echo "Continue:: hit key 1"
echo "Abort:: hit key 2"

tput sgr0
select ANS in yes no
do
    if [ "$ANS" = "yes" ]; then
        echo $ANS
        break
        else 
        echo "Aborted"
        exit 0
    fi
done




switch=$(launchctl list | grep ugee | wc -l)


if [ $switch = "3" ] ; then
    launchctl unload -w /Library/LaunchAgents/com.ugee.Pentablet2.0.plist

elif [ $switch = "2" ] ; then
     launchctl load -w /Library/LaunchAgents/com.ugee.Pentablet2.0.plist
     
else
     echo "launch or close XPPen Pentablet.app manualy"
fi



exit 0
