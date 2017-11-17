#!/bin/bash

# 5.3.2 Ensure lockout for failed password attempts is configured (Scored)

BENCHMARKNUM='cis_benchmark_5_3_2'

RESULT=

CONFIG_FILE=$(ls /etc/pam.d/*-auth | grep -P '(password|system)')

PARAMS=(
'^auth\s+required\s+pam_faillock.so\s+preauth\s+audit\s+silent\s+deny=5\s+unlock_time=900'
'^auth\s+[success=1\s+default=bad]\s+pam_unix.so'
'^auth\s+[default=die]\s+pam_faillock.so\s+authfail\s+audit\s+deny=5\s+unlock_time=900'
'^auth\s+sufficient\s+pam_faillock.so\s+authsucc\s+audit\s+deny=5\s+unlock_time=900'
)

for P in ${PARAMS[@]}
do
  RESULT=$( /bin/grep -P $P $CONFIG_FILE )

  if [[  $RESULT ]]
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
