#!/bin/bash

# 1.1.15    Ensure nodev option set on /dev/shm partition (Scored)

MOUNTPOINT=/dev/shm
OPTION=nodev
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_15=pass'
else
  echo 'cis_benchmark_1_1_15=fail'
fi
