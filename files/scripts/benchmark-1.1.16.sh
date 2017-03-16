#!/bin/bash

# 1.1.16    Ensure nosuid option set on /dev/shm partition (Scored)

MOUNTPOINT=/dev/shm
OPTION=nosuid
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_16=passed'
else
  echo 'cis_benchmark_1_1_16=failed'
fi
