#!/bin/bash

# 1.7.1.1    Ensure message of the day is configured properly (Scored)

RESULT=$(/bin/grep -P '(\\v|\\r|\\m|\\s)' /etc/motd)

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_7_1_1=passed'
else
  echo 'cis_benchmark_1_7_1_1=failed'
fi
