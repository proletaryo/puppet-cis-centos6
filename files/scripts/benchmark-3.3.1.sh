#!/bin/bash

# 3.3.1    Ensure IPv6 router advertisements are not accepted (Scored)

BENCHMARKNUM='cis_benchmark_3_3_1'

RESULT=

PARAMS=(
net.ipv6.conf.all.accept_ra
net.ipv6.conf.default.accept_ra
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
