#!/bin/bash

# 1.1.11    Ensure separate partition exists for /var/log (Scored)

MOUNTPOINT=/var/log
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_11=passed'
else
  echo 'cis_benchmark_1_1_11=failed'
fi
