#!/bin/bash

# 2.2.16    Ensure NIS Server is not enabled (Scored)
BENCHMARKNUM='cis_benchmark_2_2_16'

REGEX='^(ypserv)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
