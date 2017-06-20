#!/bin/bash

# 4.1.2    Ensure auditd service is enabled (Scored)
BENCHMARKNUM='cis_benchmark_4_1_2'

REGEX='^(auditd)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '2:on\s+3:on\s+4:on\s+5:on' )

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
