#!/bin/bash

# 5.2.15   Ensure SSH access is limited (Scored) 

BENCHMARKNUM='cis_benchmark_5.2.15'

RESULT=

CONFIG_FILE=/etc/ssh/sshd_config

PARAMS=(
'^AllowUsers\s+<userlist>'
'^AllowGroups\s+<grouplist>'
'^DenyUsers\s+<userlist>'
'^DenyGroups\s+<grouplist>'
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
