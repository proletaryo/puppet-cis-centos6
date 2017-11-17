#!/bin/bash

# 5.3.1   Ensure password creation requirements are configured (Scored) 

BENCHMARKNUM='cis_benchmark_5_3_1'

RESULT=$(ls /etc/pam.d/*-auth | grep -P '(password|system)' | while read line; do grep -P '(^password\s+requisite\s+pam_cracklib.so\s+try_first_pass\s+retry=3\s+minlen=14\s+dcredit=-\s+1\s+ucredit=-1\s+ocredit=-1\s+lcredit=-1)' $line; done)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
