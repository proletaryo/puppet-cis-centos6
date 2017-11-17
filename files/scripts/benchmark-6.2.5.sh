#!/bin/bash

#  6.2.5 Ensure root is the only UID 0 account (Scored) 

BENCHMARKNUM='cis_benchmark_6_2_5'

RESULT=$( cat /etc/passwd | awk -F: '($3 == 0) { print $1 }')

if [[ $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
