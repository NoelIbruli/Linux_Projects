#!/bin/bash

EMAIL=ibrulinoel@gmail.com

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
THRESHHOLD=0
RAM=$(echo ""; top -bn1 | grep "MiB Mem" | awk '{print $0}')
CURRENTMIN=$(top -bn1 | grep "MiB Mem" | awk '{print $6}')
MIN=7000

echo "CPU is: $CPU%$RAM"

if [ $CPU -gt $THRESHHOLD ] 2> /dev/null ; then
	echo "CPU is $CPU%" | mail -s "Cpu usage is very high!" $EMAIL
	echo "CPU is: $CPU%"
fi

if [ $CURRENTMIN -lt $MIN ] 2> /dev/null ; then
	echo "$RAM" | mail -s "RAM is running low!" $EMAIL
	echo "$RAM"
fi
# Issues with $CURRENTMIN -gt $MIN (will not work, probably due to the value of CURRENTMIN)
