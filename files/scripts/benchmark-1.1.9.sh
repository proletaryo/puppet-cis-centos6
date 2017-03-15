#!/bin/bash

# 1.1.9    Ensure nosuid option set on /var/tmp partition (Scored)

MOUNTPOINT=/var/tmp
OPTION=nosuid
RESULT=$(/bin/mount | /bin/grep -P "\s+$MOUNTPOINT\s+.+$OPTION")

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_1_9=pass'
else
  echo 'cis_benchmark_1_1_9=fail'
fi
