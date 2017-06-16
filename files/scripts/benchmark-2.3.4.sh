#!/bin/bash

# 2.3.4    Ensure telnet client is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_3_4'

RESULT=$( /bin/rpm -qa telnet )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
