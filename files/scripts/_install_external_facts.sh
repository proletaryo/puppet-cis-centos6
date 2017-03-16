#!/bin/bash

TARGET_DIR=/etc/facter/facts.d/
mkdir -p $TARGET_DIR

cp -v benchmark*.sh $TARGET_DIR
chmod u+x $TARGET_DIR/benchmark*.sh
