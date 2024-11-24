#!/usr/bin/env bash

trap 'echo " --Got SIGTERM-- "; exit 0' SIGTERM

while true; do
    printf "." && sleep 1
done