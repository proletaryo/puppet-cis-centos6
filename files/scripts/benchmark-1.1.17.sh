#!/bin/bash

# 1.1.17    Ensure noexec option set on /dev/shm partition (Scored)

MOUNTPOINT=/dev/shm
OPTION=noexec
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_17=pass'
else
  echo 'cis_benchmark_1_1_17=fail'
fi
