#!/bin/bash

# 1.1.14    Ensure nodev option set on /home partition (Scored)

MOUNTPOINT=/home
OPTION=nodev
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_14=pass'
else
  echo 'cis_benchmark_1_1_14=fail'
fi
