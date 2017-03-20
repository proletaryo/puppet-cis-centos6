#!/bin/bash

# 1.6.1.6    Ensure no unconfined daemons exist (Scored)

RESULT=$(/bin/ps -eZ | /bin/egrep "initrc" | \
/bin/egrep -vw "tr|ps|egrep|bash|awk" | /usr/bin/tr ':' ' ' | /bin/awk '{ print $NF }')

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_6_1_6=passed'
else
  echo 'cis_benchmark_1_6_1_6=failed'
fi
