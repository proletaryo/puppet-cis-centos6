#!/bin/bash

# 4.1.8  Ensure login and logout events are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_8'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/var/log/lastlog\s+-p\s+wa\s+-k\s+logins'
'^-w\s+/var/run/faillock/\s+-p\s+wa\s+-k\s+logins'
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
