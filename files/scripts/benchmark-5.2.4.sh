#!/bin/bash

# 5.2.4   Ensure SSH X11 forwarding is disabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_4'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^X11Forwarding\s+no')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
