#!/bin/bash

#  5.4.1.3 Ensure password expiration warning days is 7 or more (Scored) 

BENCHMARKNUM='cis_benchmark_5_4_1_3'

FILE=/etc/login.defs
REGEX='^PASS_WARN_AGE\s+7'

RESULT=$( cat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
