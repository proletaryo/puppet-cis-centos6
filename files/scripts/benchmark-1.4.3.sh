#!/bin/bash

# 1.4.3    Ensure authentication required for single user mode (Scored)

RESULT=$(/bin/grep -P '^SINGLE\s*=\s*/sbin/sulogin' /etc/sysconfig/init)

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_4_3=passed'
else
  echo 'cis_benchmark_1_4_3=failed'
fi
