#!/bin/bash

# 3.4.2    Ensure /etc/hosts.allow is configured (Scored)

BENCHMARKNUM='cis_benchmark_3_4_2'

RESULT=$( /bin/grep '^ALL:' /etc/hosts.allow 2>/dev/null )

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
