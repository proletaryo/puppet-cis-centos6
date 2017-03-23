#!/bin/bash

# 1.7.2    Ensure GDM login banner is configured (Scored)

RESULT=$(/bin/rpm -q gdm | /bin/grep 'package gdm is not installed')

if [[ $RESULT ]]
then
  echo 'cis_benchmark_1_7_2=passed'
else
  if [[ -e '/etc/dconf/profile/gdm' ]]
  then
    CONTENTS=$(/bin/grep -Pzo \
      'user-db:user\nsystem-db:gdm\nfile-db:/usr/share/gdm/greeter-dconf-defaults' \
      /tmp/test.txt)

    if [[ $CONTENTS ]]
    then
      # TODO: check the banner message
      echo 'cis_benchmark_1_7_2=passed'
    else
      echo 'cis_benchmark_1_7_2=failed'
    fi

  else
    echo 'cis_benchmark_1_7_2=failed'
  fi
fi
