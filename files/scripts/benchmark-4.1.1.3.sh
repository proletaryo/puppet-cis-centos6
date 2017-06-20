#!/bin/bash

# 4.1.1.3    Ensure audit logs are not automatically deleted (Scored)

BENCHMARKNUM='cis_benchmark_4_1_1_3'

RESULT=

CONFIG_FILE=/etc/audit/auditd.conf

PARAMS=(
'^max_log_file_action\s*=\s*keep_logs'
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
