#!/bin/bash

# 2.1.5    Ensure time services are not enabled (Scored)

REGEX='time-(dgram|stream)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_5=passed'
else
  echo 'cis_benchmark_2_1_5=failed'
fi
