#!/bin/bash

# 3.2.8    Ensure TCP SYN Cookies is enabled (Scored)

BENCHMARKNUM='cis_benchmark_3_2_8'

RESULT=

PARAMS=(
net.ipv4.tcp_syncookies
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
