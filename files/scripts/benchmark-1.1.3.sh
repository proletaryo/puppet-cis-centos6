#!/bin/bash

# 1.1.3    Ensure nodev option set on /tmp partition (Scored)

MOUNTPOINT=/tmp
OPTION=nodev
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_3=pass'
else
  echo 'cis_benchmark_1_1_3=fail'
fi
