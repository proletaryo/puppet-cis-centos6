#!/bin/bash

# 4.1.18  Ensure the audit configuration is immutable (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_18'

MOUNTPOINT=/etc/audit/audit.rules

RESULT=$(" /bin/grep -P "^\s*[^#]" $MOUNTPOINT | tail -1 ")

if [[ $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
