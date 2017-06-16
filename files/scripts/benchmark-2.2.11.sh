#!/bin/bash

# 2.2.11    Ensure IMAP and POP3 server is not enabled (Scored)
BENCHMARKNUM='cis_benchmark_2_2_11'

REGEX='^(dovecot|cyrus-imapd)\s'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
