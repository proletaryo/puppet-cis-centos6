#!/bin/bash

# 1.1.10    Ensure noexec option set on /var/tmp partition (Scored)

MOUNTPOINT=/var/tmp
OPTION=noexec
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_10=pass'
else
  echo 'cis_benchmark_1_1_10=fail'
fi
