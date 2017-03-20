#!/bin/bash

# 1.6.1.2    Ensure the SELinux state is enforcing (Scored)

RESULT_1=$(/bin/grep -P '^\s*SELINUX=enforcing' /etc/selinux/config)
RESULT_2=$(/usr/sbin/sestatus)

if [[ $RESULT_1 && \
$(echo $RESULT_2 | /bin/grep -P '^SELinux status:\s+enabled.+Current mode:\s+enforcing') ]]
then
  echo 'cis_benchmark_1_6_1_2=passed'
else
  echo 'cis_benchmark_1_6_1_2=failed'
fi
