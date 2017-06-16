#!/bin/bash

# 2.2.15    Ensure mail transfer agent is configured for local-only mode (Scored)
BENCHMARKNUM='cis_benchmark_2_2_15'

REGEX='^tcp\s+\d+\s+\d+\s+.+:25\s+.+LISTEN'
RESULT=$( /bin/netstat -an | /bin/grep -P $REGEX | \
  /bin/grep -v -P '\s(127.0.0.1|::1):25\s' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
