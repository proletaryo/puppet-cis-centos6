#!/bin/bash

# 1.5.1    Ensure core dumps are restricted (Scored)

RESULT_1=$(/bin/grep -P '^\*\s+hard\s+core\s+0' /etc/security/limits.conf /etc/security/limits.d/*)
RESULT_2=$(/sbin/sysctl fs.suid_dumpable | /bin/grep '^fs.suid_dumpable = 0')

if [[ $RESULT_1 && $RESULT_2 ]]
then
  echo 'cis_benchmark_1_5_1=passed'
else
  echo 'cis_benchmark_1_5_1=failed'
fi
