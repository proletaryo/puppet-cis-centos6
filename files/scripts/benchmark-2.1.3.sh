#!/bin/bash

# 2.1.3    Ensure discard services are not enabled (Scored)

REGEX='discard-(dgram|stream)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_3=passed'
else
  echo 'cis_benchmark_2_1_3=failed'
fi
