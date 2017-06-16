#!/bin/bash

# 2.2.7    Ensure NFS and RPC are not enabled (Scored)
BENCHMARKNUM='cis_benchmark_2_2_7'

REGEX='^(nfs|rpcbind)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
