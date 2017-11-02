#!/bin/bash

# 5.2.1   Ensure permissions on /etc/ssh/sshd_config are configured (Scored) 

BENCHMARKNUM='cis_benchmark_5_2_1'

RESULT=$(/usr/bin/stat /etc/ssh/sshd_config | grep -P 'Access:\s+\(0600/-rw-------\)')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
