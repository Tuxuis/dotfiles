#!/bin/bash
current=$(cat /tmp/current_power_profile)
if [ "$current" = "Bone" ]; then
    new="Balanced"
elif [ "$current" = "Balanced" ]; then
    new="Full Power"
else
    new="Bone"
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