#!/bin/bash

# 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored) 

BENCHMARKNUM='cis_benchmark_6_1_9'

RESULT=$(/usr/bin/stat /etc/gshadow- | grep -P '^Access:\s*(0600/-rw-------)\s*Uid:\s*(\s*0/\s*root)\s*Gid:\s*(\s*0/\s*root)')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
