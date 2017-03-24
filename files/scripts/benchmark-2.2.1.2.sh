#!/bin/bash

# 2.2.1.2    Ensure ntp is configured (Scored)

BENCHMARKNUM='cis_benchmark_2_2_1_2'

RESULT=0

if [[ $( /bin/rpm -qa ntp ) ]]
then
  NTPCONFIGFILE=/etc/ntp.conf

  if [[ -e $NTPCONFIGFILE ]]
  then
    LINES_RESTRICT=$( /bin/grep '^restrict' $NTPCONFIGFILE )

    if [[ ! -z $LINES_RESTRICT ]]
    then
      LINES_SERVER=$( /bin/grep '^server' $NTPCONFIGFILE )

      if [[ ! -z $LINES_SERVER ]]
      then
        LINES_OPTIONS=$( /bin/grep '^OPTIONS="-u ntp:ntp"' /etc/sysconfig/ntpd )

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
