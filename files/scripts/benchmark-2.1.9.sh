#!/bin/bash

# 2.1.9    Ensure tftp server is not enabled (Scored)

REGEX='^(tftp)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_9=passed'
else
  echo 'cis_benchmark_2_1_9=failed'
fi
