#!/bin/bash

# 2.3.1    Ensure NIS Client is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_3_1'

RESULT=$( /bin/rpm -qa ypbind )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
