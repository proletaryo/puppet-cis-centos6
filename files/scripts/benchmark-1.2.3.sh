#!/bin/bash

# 1.2.3    Ensure gpgcheck is globally activated (Scored)

RESULT=$(/bin/grep -P '^\s*gpgcheck\s*=\s*0' /etc/yum.conf /etc/yum.repos.d/*)

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_2_3=passed'
else
  echo 'cis_benchmark_1_2_3=failed'
fi
