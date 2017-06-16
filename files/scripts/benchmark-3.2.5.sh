#!/bin/bash

# 3.2.5    Ensure broadcast ICMP requests are ignored (Scored)

BENCHMARKNUM='cis_benchmark_3_2_5'

RESULT=
PARAMS=(
net.ipv4.icmp_echo_ignore_broadcasts
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
