#!/bin/bash

# 3.6.2    Ensure default deny firewall policy (Scored)

BENCHMARKNUM='cis_benchmark_3_6_2'

RESULT=

PARAMS=(
Chain INPUT \(policy DROP\)
Chain FORWARD \(policy DROP\)
Chain OUTPUT \(policy DROP\)
)

MSG=$( /sbin/iptables -L )

for P in ${PARAMS[@]}
do
  RESULT=$( echo "$MSG" | /bin/grep $P)

  if [[ ! $RESULT ]]
  then
    break
  fi
done

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
