#!/bin/bash

# 1.1.13    Ensure separate partition exists for /home (Scored)

MOUNTPOINT=/home
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_13=passed'
else
  echo 'cis_benchmark_1_1_13=failed'
fi
