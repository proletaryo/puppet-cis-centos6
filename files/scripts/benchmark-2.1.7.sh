#!/bin/bash

# 2.1.7    Ensure talk server is not enabled (Scored)

REGEX='^(talk)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_7=passed'
else
  echo 'cis_benchmark_2_1_7=failed'
fi
