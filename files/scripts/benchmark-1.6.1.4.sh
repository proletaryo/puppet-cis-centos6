#!/bin/bash

# 1.6.1.4    Ensure SETroubleshoot is not installed (Scored)

RESULT=$(/bin/rpm -q setroubleshoot | /bin/grep 'package setroubleshoot is not installed')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_6_1_4=passed'
else
  echo 'cis_benchmark_1_6_1_4=failed'
fi
