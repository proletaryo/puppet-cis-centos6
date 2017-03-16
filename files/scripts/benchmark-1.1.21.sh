#!/bin/bash

# 1.1.21    Ensure sticky bit is set on all world-writable directories (Scored)

# NOTE: bad syntax of awk in CIS document (pg. 51)
# df --local -P | awk if (NR!=1) print $6 | xargs -I '{}' find '{}' -xdev - type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null

# corrected
RESULT=$(/bin/df --local -P | /bin/awk '{ if (NR!=1) print $6 }' | \
    /usr/sbin/xargs -I '{}' find '{}' -xdev -type d \
    \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null)

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_1_21=passed'
else
  echo 'cis_benchmark_1_1_21=failed'
fi
