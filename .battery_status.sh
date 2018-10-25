#!/bin/sh


PREF=/sys/class/power_supply/BAT0
[ -r "${PREF}" ]  ||  exit 1


BATTERY_STATUS=$(< ${PREF}/status)

typeset -i FULL_CAPACITY=$(< ${PREF}/charge_full)
typeset -i WARNING_CAPACITY=$(( ${FULL_CAPACITY} * 20 / 100 ))
typeset -i LOW_CAPACITY=$(( ${FULL_CAPACITY} * 10 / 100 ))
typeset -i REMAINING_CAPACITY=$(< ${PREF}/charge_now)

REMAINING_PERCENTAGE=$( echo "scale=1; ${REMAINING_CAPACITY} * 100 / ${FULL_CAPACITY}" |bc )


case "${BATTERY_STATUS}" in
	'Full')	# battery full
		printf "|Battery Full|"
	;;
	'Discharging')	# battery discharging
		printf "|(Discharging) ${REMAINING_PERCENTAGE}%%|"
	;;
	'Charging')	# battery charging
		printf "|(Charging) AC^${REMAINING_PERCENTAGE}%%|"
	;;
esac

exit 0
