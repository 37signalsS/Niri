#!/bin/bash

cpu_temp=$(sensors k10temp-pci-00c3 | awk '/^Tctl:/ {print $2}' | tr -d '+°C' | cut -d. -f1)

ram_temp=$(sensors spd5118-i2c-2-50 | awk '/^temp1:/ {print $2}' | tr -d '+°C' | cut -d. -f1)

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f%%", 100 - $8}')

echo " ${cpu_usage} (${cpu_temp}°/${ram_temp}°)"
