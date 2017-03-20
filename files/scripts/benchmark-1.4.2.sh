#!/bin/bash

# 1.4.2    Ensure bootloader password is set (Scored)

RESULT=$(/bin/grep -P '^password\s+--md5' /boot/grub/grub.conf)

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_4_2=passed'
else
  echo 'cis_benchmark_1_4_2=failed'
fi
