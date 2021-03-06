#!/bin/bash

# 2.1.10    Ensure rsync service is not enabled (Scored)

BENCHMARKNUM='cis_benchmark_2_1_10'

REGEX='^(rsync)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
