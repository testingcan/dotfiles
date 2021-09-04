#!/bin/bash

cd "home/raphael/.config/i3/"

import -silent -window root lock.png;
notify-send --urgency low "Locking..."
convert lock.png -scale 25% -blur 0x20 -scale 400% lock.png;
composite -gravity center pad.png lock.png lock.png;

i3lock -i lock.png pad.png 
