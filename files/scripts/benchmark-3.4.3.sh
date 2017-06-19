#!/bin/bash

# 3.4.3    Ensure /etc/hosts.deny is configured (Scored)

BENCHMARKNUM='cis_benchmark_3_4_3'

RESULT=$( /bin/grep '^ALL: ALL' /etc/hosts.deny 2>/dev/null )

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
