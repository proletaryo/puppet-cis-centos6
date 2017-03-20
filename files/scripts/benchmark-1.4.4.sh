#!/bin/bash

# 1.4.4    Ensure interactive boot is not enabled (Scored)

RESULT=$(/bin/grep -P '^PROMPT\s*=\s*no' /etc/sysconfig/init)

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_4_4=passed'
else
  echo 'cis_benchmark_1_4_4=failed'
fi
