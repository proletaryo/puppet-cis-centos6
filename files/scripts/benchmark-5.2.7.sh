#!/bin/bash

# 5.2.7   Ensure SSH HostbasedAuthentication is disabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_7'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^HostbasedAuthentication\s+no')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
