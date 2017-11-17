#!/bin/bash

#  6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored) 

BENCHMARKNUM='cis_benchmark_6_2_4'

RESULT=$(/bin/grep '^+:' /etc/group )

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
