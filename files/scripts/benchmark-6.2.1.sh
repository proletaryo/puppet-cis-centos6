#!/bin/bash

#  6.2.1 Ensure password fields are not empty (Scored) 

BENCHMARKNUM='cis_benchmark_6_2_1'

RESULT=$(cat /etc/shadow | awk -F: '( $2 == "" ) { print $1 " - does not have a password" }')

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
