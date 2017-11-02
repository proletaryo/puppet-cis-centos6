#!/bin/bash

# 5.2.9   Ensure SSH PermitEmptyPasswords is disabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_9'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^PermitEmptyPasswords\s+no')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
