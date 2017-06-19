#!/bin/bash

# 3.2.6    Ensure bogus ICMP responses are ignored (Scored)

BENCHMARKNUM='cis_benchmark_3_2_6'

RESULT=

PARAMS=(
net.ipv4.icmp_ignore_bogus_error_responses
)

for P in ${PARAMS[@]}
do
  RESULT=$( /sbin/sysctl $P | /bin/grep -v "^$P = 1" )

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
