#!/bin/bash

# 5.3.3   Ensure password reuse is limited (Scored) 

BENCHMARKNUM='cis_benchmark_5_3_3'

RESULT=$(ls /etc/pam.d/*-auth | grep -P '(password|system)' | while read line; do grep -P '(^password\s+sufficient\s+pam_unix.so\s+remember=5)' $line; done)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
