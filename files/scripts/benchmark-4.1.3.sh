#!/bin/bash

# 4.1.3    Ensure auditing for processes that start prior to auditd is enabled (Scored)

BENCHMARKNUM='cis_benchmark_4_1_3'

CONFIG_FILE=/boot/grub/grub.conf

KERNEL_COUNT=$( /bin/grep -cP '^\s*kernel' $CONFIG_FILE )
KERNEL_AUDIT_COUNT=$( /bin/grep -cP '^\s*kernel.+audit=1' $CONFIG_FILE )

if [[ $? -eq 0 ]] && [[ $KERNEL_COUNT -eq $KERNEL_AUDIT_COUNT ]]
then
  echo "${BENCHMARKNUM}=passed"
else
  echo "${BENCHMARKNUM}=failed"
fi
