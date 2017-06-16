#!/bin/bash

# 2.2.13    Ensure HTTP Proxy Server is not enabled (Scored)
BENCHMARKNUM='cis_benchmark_2_2_13'

REGEX='^(squid)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
