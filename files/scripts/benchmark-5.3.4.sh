#!/bin/bash

# 5.3.4 Ensure password hashing algorithm is SHA-512 (Scored) 

BENCHMARKNUM='cis_benchmark_5_3_4'

RESULT=$(ls /etc/pam.d/*-auth | grep -P '(password|system)' | while read line; do grep -P '(^password\s+sufficient\s+pam_unix.so\s+sha512)' $line; done)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
