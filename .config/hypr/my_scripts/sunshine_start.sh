#!/bin/bash

TARGET_HOSTNAME="omarchypc"

if [[ "$HOSTNAME" == "$TARGET_HOSTNAME" ]]; then
  sunshine &
fi
