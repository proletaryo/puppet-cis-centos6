#!/bin/bash

# 4.1.4     Ensure events that modify date and time information are collected (Scored)

BENCHMARKNUM='cis_benchmark_4_1_4'

MACHINE_TYPE=`uname -m`

CONFIG_FILE=/etc/audit/audit.rules

PARAMS_64=(
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*adjtimex\s*-S\s*settimeofday\s*-k\s*time-change'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*adjtimex\s*-S\s*settimeofday\s*-S\s*stime\s*-k\s*time-\s*change'
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*clock_settime\s*-k\s*time-change'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*clock_settime\s*-k\s*time-change'
'^-w\s*/etc/localtime\s*-p\s*wa\s*-k\s*time-change'
)

PARAMS_32=(
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*adjtimex\s*-S\s*settimeofday\s*-S\s*stime\s*-k\s*time-change'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*clock_settime\s*-k\s*time-change\s*'
'^-w\s*/etc/localtime\s*-p\s*wa\s*-k\s*time-change'
)

if [ ${MACHINE_TYPE} == 'x86_64' ]
 then
# 64-bit stuff here
   for P in ${PARAMS_64[@]}
    do
      RESULT=$( /bin/grep -P $P $CONFIG_FILE )

    if [[ ! $RESULT ]]
      then
      break
    fi
  done

  if [[ $RESULT ]]
    then
      echo "${BENCHMARKNUM}=passed"
    else
      echo "${BENCHMARKNUM}=failed"
    fi

else
  # 32-bit stuff here
  for P in ${PARAMS_32[@]}
     do
       RESULT=$( /bin/grep -P $P $CONFIG_FILE )

    if [[ ! $RESULT ]]
    then
    break
  fi
  done

  if [[ $RESULT ]]
  then
    echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
fi
