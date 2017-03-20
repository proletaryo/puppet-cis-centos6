#!/bin/bash

# 1.5.3    Ensure address space layout randomization (ASLR) is enabled (Scored)

RESULT_1=$(/sbin/sysctl kernel.randomize_va_space | /bin/grep '^kernel.randomize_va_space = 2')

if [[ $RESULT_1 ]]
then
  echo 'cis_benchmark_1_5_3=passed'
else
  echo 'cis_benchmark_1_5_3=failed'
fi
