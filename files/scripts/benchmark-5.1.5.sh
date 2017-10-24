#!/bin/bash

# 5.1.5    Ensure permissions on /etc/cron.weekly are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_5'

FILE=/etc/cron.weekly
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
