#!/bin/bash

# 5.2.5   Ensure SSH MaxAuthTries is set to 4 or less (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_5'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^MaxAuthTries\s+4')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
