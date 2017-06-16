#!/bin/bash

# 2.2.2    Ensure X Window System is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_2_2'

RESULT=0

if [[ $( /bin/rpm -qa xorg-x11* ) ]]
then
  RESULT=1
fi

if [[ $RESULT -eq 0 ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
