#!/bin/bash

# 5.2.14   Ensure SSH LoginGraceTime is set to one minute or less (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_14'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^LoginGraceTime\s+60')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
