#!/bin/bash

# 1.4.1    Ensure permissions on bootloader config are configured (Scored)

RESULT=$(/usr/bin/stat /boot/grub/grub.conf | grep -P 'Access:\s+\(0600/-rw-------\)')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_4_1=passed'
else
  echo 'cis_benchmark_1_4_1=failed'
fi
