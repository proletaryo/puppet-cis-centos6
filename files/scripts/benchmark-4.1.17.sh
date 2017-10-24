#!/bin/bash

# 4.1.17  Ensure kernel module loading and unloading is collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_17'

MACHINE_TYPE=`uname -m`

CONFIG_FILE=/etc/audit/audit.rules

PARAMS_64=(
'^-w\s*/sbin/insmod\s*-p\s*x\s*-k\s*modules'
'^-w\s*/sbin/rmmod\s*-p\s*x\s*-k\s*modules'
'^-w\s*/sbin/modprobe\s*-p\s*x\s*-k\s*modules'
'^-a\s*always,exit\s*arch=b64\s*-S\s*init_module\s*-S\s*delete_module\s*-k\s*modules'
)

PARAMS_32=(
'^-w /sbin/insmod -p x -k modules'
'^-w /sbin/rmmod -p x -k modules'
'^-w /sbin/modprobe -p x -k modules'
'^-a always,exit arch=b32 -S init_module -S delete_module -k modules'
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
