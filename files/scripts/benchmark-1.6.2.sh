#!/bin/bash

# 1.6.2    Ensure SELinux is installed (Scored)

RESULT=$(/bin/rpm -q libselinux | /bin/grep -P '^libselinux-\d+.+')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_6_2=passed'
else
  echo 'cis_benchmark_1_6_2=failed'
fi
