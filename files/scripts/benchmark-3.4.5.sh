#!/bin/bash

# 3.4.5    Ensure permissions on /etc/hosts.deny are configured (Scored)

BENCHMARKNUM='cis_benchmark_3_4_5'

FILE=/etc/hosts.deny
REGEX='^Access:.+0644/-rw-r--r--.+root.+root'

RESULT=$( /usr/bin/stat $FILE | /bin/grep -P $REGEX)

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
