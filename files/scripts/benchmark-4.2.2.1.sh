#!/bin/bash

# 4.2.2.1   Ensure syslog-ng service is enabled 

BENCHMARKNUM='cis_benchmark_4_2_2_1'

REGEX='^(syslog-ng)\s'

RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '2:on\s+3:on\s+4:on\s+5:on' )

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
