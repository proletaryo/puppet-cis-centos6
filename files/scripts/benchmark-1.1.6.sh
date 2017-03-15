#!/bin/bash

# 1.1.6    Ensure separate partition exists for /var (Scored)

MOUNTPOINT=/var
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_6=pass'
else
  echo 'cis_benchmark_1_1_6=fail'
fi
