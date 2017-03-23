#!/bin/bash

# 2.1.11    Ensure xinetd is not enabled (Scored)

BENCHMARKNUM='cis_benchmark_2_1_11'

REGEX='^(xinetd)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
