#!/bin/bash

# 4.1.15  Ensure changes to system administration scope (sudoers) is collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_15'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/etc/sudoers\s+-p\s+wa\s+-k\s+scope'
'^-w\s+/etc/sudoers.d\s+-p\s+wa\s+-k\s+scope'
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
