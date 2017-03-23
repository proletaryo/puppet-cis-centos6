#!/bin/bash

# 2.1.6    Ensure rsh server is not enabled (Scored)

REGEX='^(rsh|rlogin|rexec)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_6=passed'
else
  echo 'cis_benchmark_2_1_6=failed'
fi
