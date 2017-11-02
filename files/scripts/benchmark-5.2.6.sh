#!/bin/bash

# 5.2.6   Ensure SSH IgnoreRhosts is enabled (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_6'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^IgnoreRhosts\s+yes')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
