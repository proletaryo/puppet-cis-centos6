#!/bin/bash

# 3.4.4    Ensure permissions on /etc/hosts.allow are configured (Scored)

BENCHMARKNUM='cis_benchmark_3_4_4'

FILE=/etc/hosts.allow
REGEX='^Access:.+0644/-rw-r--r--.+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
