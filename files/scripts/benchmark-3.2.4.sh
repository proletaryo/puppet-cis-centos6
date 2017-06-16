#!/bin/bash

# 3.2.4    Ensure suspicious packets are logged (Scored)

BENCHMARKNUM='cis_benchmark_3_2_4'

RESULT=
PARAMS=(
net.ipv4.conf.all.log_martians
net.ipv4.conf.default.log_martians
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
