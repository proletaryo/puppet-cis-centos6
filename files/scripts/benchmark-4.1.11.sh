#!/bin/bash

# 4.1.11   Ensure unsuccessful unauthorized file access attempts are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_11'

MACHINE_TYPE=`uname -m`

CONFIG_FILE=/etc/audit/audit.rules

PARAMS_64=(
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EACCES\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'\s*
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EACCES\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EPERM\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EPERM\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'
)

PARAMS_32=(
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EACCES\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'\s*
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*creat\s*-S\s*open\s*-S\s*openat\s*-S\s*truncate\s*-S\s*ftruncate\s*-F\s*exit=-EPERM\s*-F\s*auid>=500\s*-F\s*auid!=4294967295\s*-k\s*access'
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
