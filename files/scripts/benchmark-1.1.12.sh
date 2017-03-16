#!/bin/bash

# 1.1.12    Ensure separate partition exists for /var/log/audit (Scored)

MOUNTPOINT=/var/log/audit
RESULT=$(/bin/mount | /bin/grep "[[:space:]+]$MOUNTPOINT[[:space:]+]")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_12=passed'
else
  echo 'cis_benchmark_1_1_12=failed'
fi
