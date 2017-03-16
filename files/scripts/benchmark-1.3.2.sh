#!/bin/bash

# 1.3.2    Ensure filesystem integrity is regularly checked (Scored)

RESULT_ROOT_DIRECT=$(/usr/bin/crontab -u root -l 2>&1 | /bin/grep aide | /bin/grep -vP '^\s*#')
RESULT_ROOT_ETC=$(/bin/grep -r aide /etc/cron.* /etc/crontab | /bin/grep -vP '^\s*#')

if [[ $RESULT_ROOT_DIRECT && $RESULT_ROOT_ETC ]]
then
  echo 'cis_benchmark_1_3_2=passed'
else
  echo 'cis_benchmark_1_3_2=failed'
fi
