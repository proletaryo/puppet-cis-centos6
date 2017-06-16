#!/bin/bash

# 2.2.1.3    Ensure chrony is configured (Scored)

BENCHMARKNUM='cis_benchmark_2_2_1_3'

RESULT=0

if [[ $( /bin/rpm -qa chrony ) ]]
then
  CONFIGFILE=/etc/chrony.conf

  if [[ -e $CONFIGFILE ]]
  then
    LINES_SERVER=$( /bin/grep '^server' $CONFIGFILE )

    if [[ ! -z $LINES_SERVER ]]
    then
        LINES_OPTIONS=$( /bin/grep '^OPTIONS="-u chrony"' /etc/sysconfig/chronyd )

        if [[ ! -z $LINES_OPTIONS ]]
        then
          RESULT=1
        fi
    else
      RESULT=1
    fi
  else
    RESULT=1
  fi
fi

if [[ $RESULT -eq 0 ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
