#!/bin/bash

# 6.2.19  Ensure no duplicate group names exist 

BENCHMARKNUM='cis_benchmark_6_2_19'

RESULT=$( cat /etc/group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do [ -z "${x}" ] && break
set - $x
if [ $1 -gt 1 ]; then
  gids=`awk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs`
  echo "Duplicate Group Name ($2): ${gids}"
    fi
  done ) 


if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
