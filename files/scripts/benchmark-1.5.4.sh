#!/bin/bash

# 1.5.4    Ensure prelink is disabled (Scored)

RESULT=$(/bin/rpm -q prelink | /bin/grep 'package prelink is not installed')

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_5_4=passed'
else
  echo 'cis_benchmark_1_5_4=failed'
fi
