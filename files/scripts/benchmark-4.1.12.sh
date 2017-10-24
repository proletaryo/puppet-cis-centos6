#!/bin/bash

# 4.1.12  Ensure use of privileged commands is collected (Scored) 

# NOTE: bad syntax of awk in CIS document (pg. 51)
# remidiate: find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged" }'
      

# corrected
RESULT=$(/bin/df --local -P | /bin/awk '{ if (NR!=1) print $6 }' | \
    /usr/sbin/xargs -I '{}' find '{}' -xdev -type d \
    \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null)

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_4_1_12=passed'
else
  echo 'cis_benchmark_4_1_12=failed'
fi
