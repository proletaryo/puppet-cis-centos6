#!/bin/bash

# 3.2.1    Ensure source routed packets are not accepted (Scored)

BENCHMARKNUM='cis_benchmark_3_2_1'

RESULT=
PARAMS=(
net.ipv4.conf.all.accept_source_route
net.ipv4.conf.default.accept_source_route
)

for P in ${PARAMS[@]}
do
  RESULT=$( /sbin/sysctl $P | /bin/grep -v "^$P = 0" )

  if [[ $RESULT ]]
  then
    break
  fi
done

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
