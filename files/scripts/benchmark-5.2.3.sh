#!/bin/bash

# 5.2.3  Ensure SSH LogLevel is set to INFO (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_3'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P 'LogLevel\s+INFO')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
