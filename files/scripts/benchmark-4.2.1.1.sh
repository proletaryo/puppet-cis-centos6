#!/bin/bash

# 4.2.1.1   Ensure rsyslog Service is enabled 
BENCHMARKNUM='cis_benchmark_4_2_1_1'

REGEX='^(rsyslog)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '2:on\s+3:on\s+4:on\s+5:on' )

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
