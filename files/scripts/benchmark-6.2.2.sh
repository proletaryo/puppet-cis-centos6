#!/bin/bash

#  6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored) 

BENCHMARKNUM='cis_benchmark_6_2_2'

RESULT=$(/bin/grep '^+:' /etc/passwd )

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
