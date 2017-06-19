#!/bin/bash

# 3.2.7    Ensure Reverse Path Filtering is enabled (Scored)

BENCHMARKNUM='cis_benchmark_3_2_7'

RESULT=

PARAMS=(
net.ipv4.conf.all.rp_filter
net.ipv4.conf.default.rp_filter
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
