#!/bin/bash

#  5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored) 

BENCHMARKNUM='cis_benchmark_5_4_1_2'

FILE=/etc/login.defs
REGEX='^PASS_MIN_DAYS\s+7'

RESULT=$( /bin/cat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
