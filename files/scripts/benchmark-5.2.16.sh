#!/bin/bash

# 5.2.16   Ensure SSH warning banner is configured (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_16'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^Banner\s+/etc/issue.net')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
