#!/bin/bash

MOUNTPOINT=/tmp
OPTION=nosuid
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_4=pass'
else
  echo 'cis_benchmark_1_1_4=fail'
fi
