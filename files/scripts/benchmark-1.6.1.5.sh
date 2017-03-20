#!/bin/bash

# 1.6.1.5    Ensure the MCS Translation Service (mcstrans) is not installed (Scored)

RESULT=$(/bin/rpm -q mcstrans | /bin/grep 'package mcstrans is not installed')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_6_1_5=passed'
else
  echo 'cis_benchmark_1_6_1_5=failed'
fi
