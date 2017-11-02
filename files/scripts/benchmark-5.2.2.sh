#!/bin/bash

# 5.2.2  Ensure SSH Protocol is set to 2 (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_2'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P 'Protocol\s+2')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
