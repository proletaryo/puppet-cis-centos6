#!/bin/bash

# 1.1.2    Ensure separate partition exists for /tmp (Scored)

MOUNTPOINT=/tmp
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_2=pass'
else
  echo 'cis_benchmark_1_1_2=fail'
fi
