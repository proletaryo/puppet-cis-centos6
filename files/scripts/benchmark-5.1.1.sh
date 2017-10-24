#!/bin/bash

# 5.1.1    Ensure cron daemon is enabled (Scored)

BENCHMARKNUM='cis_benchmark_5_1_1'

REGEX='^(crond)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:off' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
