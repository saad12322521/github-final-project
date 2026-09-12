#!/bin/bash

# ============================================================
# Simple Interest Calculator
# Formula: SI = (P * R * T) / 100
# Total Amount = P + SI
# ============================================================

echo "===================================="
echo "   Simple Interest Calculator"
echo "===================================="

# Take principal amount as input
read -p "Enter the principal amount (P): " principal

# Take rate of interest as input
read -p "Enter the rate of interest per year in % (R): " rate

# Take time period as input
read -p "Enter the time period in years (T): " time

# Validate that inputs are numeric
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values for principal, rate, and time."
    exit 1
fi

# Calculate simple interest using bc for decimal precision
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo "------------------------------------"
echo "Principal Amount   : $principal"
echo "Rate of Interest    : $rate %"
echo "Time Period         : $time years"
echo "------------------------------------"
echo "Simple Interest     : $simple_interest"
echo "Total Amount        : $total_amount"
echo "===================================="
