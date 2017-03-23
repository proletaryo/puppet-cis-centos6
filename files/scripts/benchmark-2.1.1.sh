#!/bin/bash

# 2.1.1    Ensure chargen services are not enabled (Scored)

REGEX='chargen-(dgram|stream)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_1=passed'
else
  echo 'cis_benchmark_2_1_1=failed'
fi
