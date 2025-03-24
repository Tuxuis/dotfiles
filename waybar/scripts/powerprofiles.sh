#!/bin/bash
# Ensure a default profile
if [ ! -f /tmp/current_power_profile ]; then
    echo "Bone" > /tmp/current_power_profile
fi
profile=$(cat /tmp/current_power_profile)

case "$profile" in
    Bone)
        icon="󰋘"  # powersave icon
        ;;
    Balanced)
        icon="󰋙"
        ;;
    "Full Power")
        icon="󰋚"
        ;;
esac

if [ -f /tmp/powerprofiles_visible ]; then
    # Slider is visible
    text="<span size=\"small\">$icon  $profile</span>"
    cls="visible"
else
    text=""
    cls=""
fi

echo "{\"text\": \"$text\", \"class\": \"$cls\"}"
