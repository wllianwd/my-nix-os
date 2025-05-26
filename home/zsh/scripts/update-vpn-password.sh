#!/bin/bash

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo "fzf not found! Please install fzf to use interactive VPN selector."
  exit 1
fi

# Get VPN connection names into an array
mapfile -t vpns < <(nmcli -t -f NAME,TYPE connection show | grep ":vpn" | cut -d: -f1)

if [ ${#vpns[@]} -eq 0 ]; then
  echo "No VPN connections found."
  exit 1
fi

# Use fzf for interactive selection
vpn_name=$(printf '%s\n' "${vpns[@]}" | fzf --prompt="Select VPN: " --height=10 --border)

if [ -z "$vpn_name" ]; then
  echo "No VPN selected."
  exit 1
fi

echo "Selected VPN: $vpn_name"

# Prompt for password (hidden input)
read -rsp "Enter VPN password: " vpn_password
echo

# Get existing vpn.data
raw_vpn_data=$(nmcli -g vpn.data connection show "$vpn_name")

# Remove any password-flags entries completely
cleaned_vpn_data=$(echo "$raw_vpn_data" | sed 's/password-flags=[^,]*//g')

# Remove backslash before colon, keep colon intact
cleaned_vpn_data=$(echo "$cleaned_vpn_data" | sed 's/\\:/:/g')

# Clean up duplicate commas and leading/trailing commas
cleaned_vpn_data=$(echo "$cleaned_vpn_data" | sed 's/,,*/,/g' | sed 's/^,\|,$//g')

# Apply changes
nmcli connection modify "$vpn_name" vpn.data "$cleaned_vpn_data" vpn.secrets "password=$vpn_password"

echo "✅ Password set for VPN '$vpn_name' and password prompt disabled."
