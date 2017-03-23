#!/bin/bash

# 2.1.4    Ensure echo services are not enabled (Scored)

REGEX='echo-(dgram|stream)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_4=passed'
else
  echo 'cis_benchmark_2_1_4=failed'
fi
