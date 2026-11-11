#!/usr/bin/env bash

# Calculate simple interest from principal, annual rate (%), and time (years).
set -euo pipefail

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period (years): " time

for value in "$principal" "$rate" "$time"; do
  if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: please enter non-negative numeric values." >&2
    exit 1
  fi
done

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "Simple interest: %.2f\n", p * (r / 100) * t }'
