#!/bin/bash

# 1.1.5    Ensure noexec option set on /tmp partition (Scored)

MOUNTPOINT=/tmp
OPTION=noexec
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_5=pass'
else
  echo 'cis_benchmark_1_1_5=fail'
fi
