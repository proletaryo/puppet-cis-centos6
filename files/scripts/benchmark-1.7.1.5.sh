#!/bin/bash

# 1.7.1.5    Ensure permissions on /etc/issue are configured (Scored)

RESULT=$(/usr/bin/stat /etc/issue | grep -P 'Access:\s+\(0644/-rw-r--r--\)')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_7_1_5=passed'
else
  echo 'cis_benchmark_1_7_1_5=failed'
fi
