#!/bin/bash

# 5.2.11    Ensure only approved ciphers are used (Scored)

BENCHMARKNUM='cis_benchmark_5_2_11'

RESULT=$(cat /etc/ssh/sshd_config | /bin/grep -P '^Ciphers\s+aes256-ctr,aes192-ctr,aes128-ctr')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
