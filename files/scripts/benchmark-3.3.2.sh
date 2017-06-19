#!/bin/bash

# 3.3.2    Ensure IPv6 redirects are not accepted (Scored)

BENCHMARKNUM='cis_benchmark_3_3_2'

RESULT=

PARAMS=(
net.ipv6.conf.all.accept_redirects
net.ipv6.conf.default.accept_redirects
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
