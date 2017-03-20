#!/bin/bash

# 1.6.1.3    Ensure SELinux policy is configured (Scored)

RESULT_1=$(/bin/grep -P '^\s*SELINUXTYPE=targeted' /etc/selinux/config)
RESULT_2=$(/usr/sbin/sestatus | /bin/grep -P 'Policy from config file:.+targeted')

if [[ $RESULT_1 && $RESULT_2 ]]
then
  echo 'cis_benchmark_1_6_1_3=passed'
else
  echo 'cis_benchmark_1_6_1_3=failed'
fi
