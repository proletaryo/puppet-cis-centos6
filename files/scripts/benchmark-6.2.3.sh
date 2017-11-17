#!/bin/bash

#  6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored) 

BENCHMARKNUM='cis_benchmark_6_2_3'

RESULT=$(/bin/grep '^+:' /etc/shadow )

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
