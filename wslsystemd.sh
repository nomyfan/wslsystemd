#!/bin/bash

systemd_pid=

if [ -z $(pidof systemd) ]; then
	daemonize /usr/bin/unshare -fp --propagation shared --mount-proc systemd
fi

while [ -z $systemd_pid ]
do
	for pid in $(pidof systemd)
	do
		systemd_pid=$pid
	done
done

if [ -z $WHO ]; then
	WHO=root
	WD=/
else
	WD=/home/$WHO
fi

nsenter -t $systemd_pid -m -p --wd=$WD runuser -m -p -u $WHO zsh
