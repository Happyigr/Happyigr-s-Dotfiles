#!/bin/sh
memory=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

echo "$memory $temp°C"
