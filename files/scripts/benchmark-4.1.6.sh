#!/bin/bash

# 4.1.6     Ensure events that modify the system's network environment are collected (Scored) 

BENCHMARKNUM='cis_benchmark_4_1_6'

MACHINE_TYPE=`uname -m`

CONFIG_FILE=/etc/audit/audit.rules

PARAMS_64=(
'^-a\s*always,exit\s*-F\s*arch=b64\s*-S\s*sethostname\s*-S\s*setdomainname\s*-k\s*system-locale'
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*sethostname\s*-S\s*setdomainname\s*-k\s*system-locale'
'^-w\s*/etc/issue\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/issue.net\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/hosts\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/sysconfig/network\s*-p\s*wa\s*-k\s*system-locale'
)

PARAMS_32=(
'^-a\s*always,exit\s*-F\s*arch=b32\s*-S\s*sethostname\s*-S\s*setdomainname\s*-k\s*system-locale'
'^-w\s*/etc/issue\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/issue.net\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/hosts\s*-p\s*wa\s*-k\s*system-locale'
'^-w\s*/etc/sysconfig/network\s*-p\s*wa\s*-k\s*system-locale'
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
