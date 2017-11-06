#!/bin/bash

# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored) 

BENCHMARKNUM='cis_benchmark_6_1_6'

RESULT=$(/usr/bin/stat /etc/passwd- | grep -P '^Access:\s*(0600/-rw-------)\s*Uid:\s*(\s*0/\s*root)\s*Gid:\s*(\s*0/\s*root)')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
