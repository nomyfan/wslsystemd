#!/bin/bash

pids=$(pidof systemd)

if [ -z $pids ]; then
	echo No systemd found, creating a new one...
	nohup unshare -fp --propagation shared --mount-proc systemd >/dev/null 2>&1 &
	echo Done. Please run again
	exit 0
else
	for pid in $pids
	do
		systemd_pid=$pid
	done
fi

if [ -z $WHO ]; then
	WHO=root
	WD=/
else
	WD=/home/$WHO
fi

nsenter -t $systemd_pid -m -p --wd=$WD runuser -m -p -u $WHO zsh
