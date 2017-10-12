#!/bin/bash

# 4.1.9 Ensure session initiation information is collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_9'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/var/run/utmp\s+-p\s+wa\s+-k\s+session'
'^-w\s+/var/log/wtmp\s+-p\s+wa\s+-k\s+session'
'^-w\s+/var/log/btmp\s+-p\s+wa\s+-k\s+session'
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
