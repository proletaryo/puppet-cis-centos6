#!/bin/bash

# 2.2.14    Ensure SNMP Server is not enabled (Scored)
BENCHMARKNUM='cis_benchmark_2_2_14'

REGEX='^(snmpd)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
