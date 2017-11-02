#!/bin/bash

# 5.2.10   Ensure SSH PermitUserEnvironment is disabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_10'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^PermitUserEnvironment\s+no')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
