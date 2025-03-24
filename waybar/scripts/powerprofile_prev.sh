#!/bin/bash
current=$(cat /tmp/current_power_profile)
if [ "$current" = "Bone" ]; then
    new="Full Power"
elif [ "$current" = "Balanced" ]; then
    new="Bone"
else
    new="Balanced"
fi
echo "$new" > /tmp/current_power_profile

case "$new" in
    Bone)
        sudo tuned-adm profile powersave
        ;;
    Balanced)
        sudo tuned-adm profile balanced
        ;;
    "Full Power")
        sudo tuned-adm profile performance
        ;;
esac
