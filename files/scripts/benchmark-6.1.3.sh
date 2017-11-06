#!/bin/bash

# 6.1.3 Ensure permissions on /etc/shadow are configured (Scored) 

BENCHMARKNUM='cis_benchmark_6_1_3'

RESULT=$(/usr/bin/stat /etc/shadow | grep -P '^Access:\s*(0000/----------)\s*Uid:\s*(\s*0/\s*root)\s*Gid:\s*(\s*0/\s*root)')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
