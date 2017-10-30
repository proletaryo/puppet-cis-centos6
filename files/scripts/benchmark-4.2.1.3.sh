#!/bin/bash

# 4.2.1.3   Ensure rsyslog default file permissions configured  

BENCHMARKNUM='cis_benchmark_4_2_1_3'

RESULT=$(/bin/grep -P '^\$FileCreateMode\s*0640' /etc/rsyslog.conf )

if [[ -z $RESULT ]]
then
    echo "${BENCHMARKNUM}=passed"
  else
      echo "${BENCHMARKNUM}=failed"
    fi
