#!/bin/bash

# 1.1.7    Ensure separate partition exists for /var/tmp (Scored)

MOUNTPOINT=/var/tmp
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_7=passed'
else
  echo 'cis_benchmark_1_1_7=failed'
fi
