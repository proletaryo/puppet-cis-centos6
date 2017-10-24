#!/bin/bash

# 5.1.7    Ensure permissions on /etc/cron.d are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_7'

FILE=/etc/cron.d
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
