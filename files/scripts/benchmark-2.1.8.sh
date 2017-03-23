#!/bin/bash

# 2.1.8    Ensure telnet server is not enabled (Scored)

REGEX='^(telnet)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_8=passed'
else
  echo 'cis_benchmark_2_1_8=failed'
fi
