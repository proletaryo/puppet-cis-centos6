#!/bin/bash

MODULE=fat
RESULT=$(/sbin/lsmod | /bin/grep $MODULE)

if [[ -z $RESULT ]]
then
  # module is not loaded in kernel, check if this was remediated
  RESULT=$(/bin/grep "install[[:space:]+]$MODULE[[:space:]+]/bin/true" /etc/modprobe.d/*)
  if [[ $RESULT ]]
  then
    echo 'cis_benchmark_1_1_1_8=pass'
  else
    echo 'cis_benchmark_1_1_1_8=fail'
  fi
else
  echo 'cis_benchmark_1_1_1_8=fail'
fi
