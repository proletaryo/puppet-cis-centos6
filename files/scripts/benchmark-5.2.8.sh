#!/bin/bash

# 5.2.8   Ensure SSH root login is disabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_8'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^PermitRootLogin\s+no')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
