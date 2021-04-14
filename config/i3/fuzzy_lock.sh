#!/bin/sh -e

# Take a screenshot
scrot -o /tmp/screen_locked.png

# Pixellate it 10x
# mogrify -scale 20% -scale 500% /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x5 /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
