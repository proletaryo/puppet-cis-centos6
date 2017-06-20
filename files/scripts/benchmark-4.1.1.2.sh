#!/bin/bash

# 4.1.1.2    Ensure system is disabled when audit logs are full (Scored)

BENCHMARKNUM='cis_benchmark_4_1_1_2'

RESULT=

CONFIG_FILE=/etc/audit/auditd.conf

PARAMS=(
'^space_left_action\s*=\s*email'
'^action_mail_acct\s*=\s*root'
'^admin_space_left_action\s*=\s*halt'
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
