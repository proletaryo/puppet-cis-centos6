#!/bin/bash

# 4.1.7   Ensure events that modify the system's Mandatory Access Controls are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_7'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/etc/selinux/\s+-p\s+wa\s+-k\s+MAC-policy'
)

for P in ${PARAMS[@]}
do
  RESULT=$( /bin/grep -P $P $CONFIG_FILE )

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
