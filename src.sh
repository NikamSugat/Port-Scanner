#!/bin/bash

# Simple Penetration Testing Script - Port Scanner
# Made by Sugat Nikam

# Check if the script is run with the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo -e "\e[1;31mUsage: $0 <target_host>\e[0m"
    exit 1
fi

target_host="$1"

# Function to print colored text
print_colored_text() {
    local text="$1"
    local color_code="$2"
    echo -e "\e[${color_code}m${text}\e[0m"
}

# Display the banner
print_colored_text "*********************************************************" "1;33"
print_colored_text "************                                    ************" "1;33"
print_colored_text "************   Simple Port  Scanning  Script   ************" "1;33"
print_colored_text "************                                    ************" "1;33"
print_colored_text "************         Made by Sugat Nikam          ************" "1;33"
print_colored_text "************                                    ************" "1;33"
print_colored_text "*********************************************************" "1;33"
echo

# Perform port scanning using netcat
print_colored_text "Scanning ports on $target_host..." "1;34"
for port in {1..1024}; do
    # Use timeout to limit the connection attempt time
    timeout 1 bash -c "echo >/dev/tcp/$target_host/$port" 2>/dev/null && \
        print_colored_text "Port $port is open" "1;32" || \
        print_colored_text "Port $port is closed" "1;31"
done

print_colored_text "Port scanning completed." "1;34"
