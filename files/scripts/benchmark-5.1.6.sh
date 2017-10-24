#!/bin/bash

# 5.1.6    Ensure permissions on /etc/cron.monthly are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_6'

FILE=/etc/cron.monthly
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
