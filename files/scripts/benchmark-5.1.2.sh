#!/bin/bash

# 5.1.2    Ensure permissions on /etc/crontab are configured (Scored)

BENCHMARKNUM='cis_benchmark_5_1_2'

FILE=/etc/crontab
REGEX='^Access:.+00/.+------\).+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
