#!/bin/bash

# 2.3.3    Ensure talk client is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_3_3'

RESULT=$( /bin/rpm -qa talk )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
