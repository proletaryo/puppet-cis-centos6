#!/bin/bash

# 3.6.3    Ensure loopback traffic is configured (Scored)

BENCHMARKNUM='cis_benchmark_3_6_3'

RESULT=

# INPUT
PARAMS_INPUT=(
'ACCEPT.+all.+lo.+\*.+0\.0\.0\.0\/0.+0\.0\.0\.0\/0'
'DROP.+all.+\*.+\*.+127\.0\.0\.0\/8.+0\.0\.0\.0\/0'
)

MSG_INPUT=$( /sbin/iptables -L INPUT -v -n)

for P in ${PARAMS_INPUT[@]}
do
  RESULT=$( echo "$MSG_INPUT" | /bin/grep -P $P)

  if [[ ! $RESULT ]]
  then
    break
  fi
done

# OUTPUT
if [[ $RESULT ]]
then
  PARAMS_OUTPUT=(
  'ACCEPT.+all.+\*.+lo.+0\.0\.0\.0\/0.+0\.0\.0\.0\/0'
  )

  MSG_OUTPUT=$( /sbin/iptables -L OUTPUT -v -n)

  for P in ${PARAMS_OUTPUT[@]}
  do
    RESULT=$( echo "$MSG_OUTPUT" | /bin/grep -P $P)

    if [[ ! $RESULT ]]
    then
      break
    fi
  done
fi

if [[ $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
