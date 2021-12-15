#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
THRESHHOLD=90

echo "$CPU"

if [ $CPU -gt $THRESHHOLD ] 2>/dev/null ; then
	echo "CPU usage is high!"
else
	echo "CPU usage is normal!"
fi
