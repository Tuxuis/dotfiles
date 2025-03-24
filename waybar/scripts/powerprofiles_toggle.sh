#!/bin/bash
if [ -f /tmp/powerprofiles_visible ]; then
    rm /tmp/powerprofiles_visible
else
    touch /tmp/powerprofiles_visible
fi