#!/bin/bash

# 1.3.1    Ensure AIDE is installed (Scored)

RESULT=$(/bin/rpm -q aide | /bin/grep 'package aide is not installed')

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_3_1=passed'
else
  echo 'cis_benchmark_1_3_1=failed'
fi
