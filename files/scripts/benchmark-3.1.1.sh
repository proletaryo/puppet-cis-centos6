#!/bin/bash

# 3.1.1    Ensure IP forwarding is disabled (Scored)

BENCHMARKNUM='cis_benchmark_3_1_1'

RESULT=$( /sbin/sysctl net.ipv4.ip_forward | 
  /bin/grep -v '^net.ipv4.ip_forward = 0' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
