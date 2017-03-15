#!/bin/bash

MOUNTPOINT=/tmp
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_2=pass'
else
  echo 'cis_benchmark_1_1_2=fail'
fi
