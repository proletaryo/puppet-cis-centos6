#!/bin/bash

MODULE=udf
RESULT=$(/sbin/lsmod | /bin/grep $MODULE)

if [[ -z $RESULT ]]
then
  # module is not loaded in kernel, check if this was remediated
  RESULT=$(/bin/grep "install[[:space:]+]$MODULE[[:space:]+]/bin/true" /etc/modprobe.d/*)
  if [[ $RESULT ]]
  then
    echo 'cis_benchmark_1_1_1_7=pass'
  else
    echo 'cis_benchmark_1_1_1_7=fail'
  fi
else
  echo 'cis_benchmark_1_1_1_7=fail'
fi
