#!/bin/bash

# 1.1.8    Ensure nodev option set on /var/tmp partition (Scored)

MOUNTPOINT=/var/tmp
OPTION=nodev
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_8=passed'
else
  echo 'cis_benchmark_1_1_8=failed'
fi
