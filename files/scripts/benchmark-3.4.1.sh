#!/bin/bash

# 3.4.1    Ensure TCP Wrappers is installed (Scored)

BENCHMARKNUM='cis_benchmark_3_4_1'

RESULT=

PARAMS=(
tcp_wrappers
tcp_wrappers-libs
)

for P in ${PARAMS[@]}
do
  RESULT=$( /bin/rpm -qa $P )

  if [[ ! $RESULT ]]
  then
    break
  fi
done

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
