#!/bin/bash

# 5.2.12   Ensure only approved MAC algorithms are used (Scored)

BENCHMARKNUM='cis_benchmark_5_2_12'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^MACs\s+hmac-sha2-512,hmac-sha2-256')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
