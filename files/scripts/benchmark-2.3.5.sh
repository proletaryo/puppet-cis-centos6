#!/bin/bash

# 2.3.5    Ensure LDAP client is not installed (Scored)

BENCHMARKNUM='cis_benchmark_2_3_5'

RESULT=$( /bin/rpm -qa openldap-clients )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
