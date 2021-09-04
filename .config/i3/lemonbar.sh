#!/bin/bash
HIGHLIGHT="#ffffff"
clock() {
	        TIME=$(date "+%l:%M")
		        DATE=$(date "+%a %D")
			        echo -n " %{F$HIGHLIGHT}$(printf '%b' "\ue016")%{F-}$TIME  %{F$HIGHLIGHT}$(printf '%b' "\ue26a")%{F-} $DATE "


}
#Copied from /u/Dylan112
windowtitle(){
	        # Grabs focused window's title
		        # The echo "" at the end displays when no windows are focused.
			        TITLE=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p || echo "")
				        TITLECUT=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p | sed 's/\///g;s/-//g;s/ /\\/g' | cut -c 1-6 || echo "")
					 
					        if [ $TITLECUT = "glenn@"  ]; then
							                echo "$(printf '%b' "\ue1d9") $(echo "$TITLE" | cut -c 15-50)"
									        else
											                echo "$TITLE" | cut -c 1-50
													        fi

}
 
while true; do
	        echo "%{B#c0303048}$(clock) $(volume) $(music)%{B-}%{c} $(workspace) %{r}%{B#c0303048} $(windowtitle) %{B-}"
		        sleep .1;
		done |
		#old one was '-g 1690x20+2035+1019'
		lemonbar -p -b -d -B#c0262626 -F#A0A0A0 -g 1830x20+45+0\
			 -f 'Inconsolata'\
			   | bash
