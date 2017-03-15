#!/bin/bash

# 1.1.22    Disable Automounting (Scored)

RESULT=$(/sbin/chkconfig --list autofs 2>/dev/null | /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_1_21=pass'
else
  echo 'cis_benchmark_1_1_21=fail'
fi
