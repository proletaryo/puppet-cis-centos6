#!/bin/bash

MOUNTPOINT=/tmp
OPTION=nodev
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_3=pass'
else
  echo 'cis_benchmark_1_1_3=fail'
fi
