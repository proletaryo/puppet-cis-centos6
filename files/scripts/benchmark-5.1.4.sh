#!/bin/bash

# 5.1.4    Ensure permissions on /etc/cron.daily are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_4'

FILE=/etc/cron.daily
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
