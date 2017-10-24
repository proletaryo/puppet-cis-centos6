#!/bin/bash

# 4.1.14  Ensure file deletion events by users are collected (Scored)

BENCHMARKNUM='cis_benchmark_4_1_14'

MACHINE_TYPE=`uname -m`

CONFIG_FILE=/etc/audit/audit.rules

PARAMS_64=(
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*unlink\s*-S\s*unlinkat\s*-S\s*rename\s*-S\s*renameat\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*delete'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*unlink\s*-S\s*unlinkat\s*-S\s*rename\s*-S\s*renameat\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*delete'
)

PARAMS_32=(
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*unlink\s*-S\s*unlinkat\s*-S\s*rename\s*-S\s*renameat\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*delete'
)

if [ ${MACHINE_TYPE} == 'x86_64' ]
 then
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
