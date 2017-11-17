#!/bin/bash

#  5.4.1.1 Ensure password expiration is 90 days or less (Scored)

BENCHMARKNUM='cis_benchmark_5_4_1_1'

FILE=/etc/login.defs
REGEX='^PASS_MAX_DAYS\s+90'

RESULT=$( /bin/cat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
