#!/bin/bash

# 5.1.3    Ensure permissions on /etc/cron.hourly are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_3'

FILE=/etc/cron.hourly
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
