#!/bin/bash

# 4.2.1.4  Ensure rsyslog is configured to send logs to a remote log host 

BENCHMARKNUM='cis_benchmark_4_2_1_4'

RESULT=$(/bin/grep -P "^*.*[^I][^I]*@" /etc/rsyslog.conf )

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
