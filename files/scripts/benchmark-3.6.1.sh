#!/bin/bash

# 3.6.1    Ensure iptables is installed (Scored)

BENCHMARKNUM='cis_benchmark_3_6_1'

RESULT=

PARAMS=(
iptables
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
