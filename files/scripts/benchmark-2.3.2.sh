#!/bin/bash

# 2.3.2    Ensure rsh client is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_3_2'

RESULT=$( /bin/rpm -qa rsh )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
