#!/bin/sh


typeset -i USED=0
typeset -i AVAIL=0
typeset -i FREE=0
typeset -i CACHED=0

typeset -i USER=0
typeset -i NICE=0
typeset -i SYS=0
typeset -i IO=0
typeset -i IDLE=0



_battery() {
	BAT_OUTPUT=$(/home/guru/.battery_status.sh)
}
_vol(){   VOL=$( amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]' )
}


OS=$(uname -s)

BAT_OUTPUT=''
VOL=''
while :;do
	_vol; echo -n " vol:${VOL} "
	_battery; echo -n "${BAT_OUTPUT} "
	echo
done
