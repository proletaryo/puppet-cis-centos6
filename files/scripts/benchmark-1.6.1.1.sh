#!/bin/bash

# 1.6.1.1    Ensure SELinux is not disabled in bootloader configuration (Scored)

RESULT=$(/bin/grep -P '^\s*kernel.+(selinux|enforcing)=0' /boot/grub/grub.conf)

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_1_6_1_1=passed'
else
  echo 'cis_benchmark_1_6_1_1=failed'
fi
