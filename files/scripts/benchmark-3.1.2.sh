#!/bin/bash

# 3.1.2    Ensure packet redirect sending is disabled (Scored)

BENCHMARKNUM='cis_benchmark_3_1_2'

RESULT=
PARAMS=(
net.ipv4.conf.all.send_redirects
net.ipv4.conf.default.send_redirects
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
