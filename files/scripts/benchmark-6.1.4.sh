#!/bin/bash

# 6.1.4 Ensure permissions on /etc/group are configured (Scored) 

BENCHMARKNUM='cis_benchmark_6_1_4'

RESULT=$(/usr/bin/stat /etc/group | grep -P '^Access:\s*(0644/-rw-r--r--)\s*Uid:\s*(\s*0/\s*root)\s*Gid:\s*(\s*0/\s*root)')

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
