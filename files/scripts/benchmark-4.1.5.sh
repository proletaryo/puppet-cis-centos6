#!/bin/bash

# 4.1.5   Ensure events that modify user/group information are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_5'

RESULT=

CONFIG_FILE=/etc/audit/audit.rules

PARAMS=(
'^-w\s+/etc/group\s+-p\s+wa\s+-k\s+identity'
'^-w\s+/etc/passwd\s+-p\s+wa\s+-k\s+identity'
'^-w\s+/etc/gshadow\s+-p\s+wa\s+-k\s+identity'
'^-w\s+/etc/shadow\s+-p\s+wa\s+-k\s+identity'
'^-w\s+/etc/security/opasswd\s+-p\s+wa\s+-k\s+identity'
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
