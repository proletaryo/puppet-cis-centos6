#!/bin/bash

# 4.1.16  Ensure system administrator actions (sudolog) are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_16'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/var/log/sudo.log\s+-p\s+wa\s+-k\s+actions'
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
