#!/bin/bash

EMAIL=ibrulinoel@gmail.com

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
THRESHHOLD=90

echo "CPU is: $CPU%"

if [ $CPU -gt $THRESHHOLD ] 2> /dev/null ; then
	echo "CPU is $CPU%" | mail -s "Cpu usage is very high!" $EMAIL
else
	echo "CPU is $CPU%" | mail -s "Cpu usage is normal!" $EMAIL
fi
