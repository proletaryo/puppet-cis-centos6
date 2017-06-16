#!/bin/bash

# 3.2.3    Ensure secure ICMP redirects are not accepted (Scored)

BENCHMARKNUM='cis_benchmark_3_2_3'

RESULT=
PARAMS=(
net.ipv4.conf.all.secure_redirects
net.ipv4.conf.default.secure_redirects
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
