#!/bin/bash

# 2.2.1.2    Ensure ntp is configured (Scored)

BENCHMARKNUM='cis_benchmark_2_2_1_2'

RESULT=

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
