#!/bin/bash

echo "change DNS to shecan"

# Backup the original resolv.conf
if ! test -f /etc/resolv.conf_systemmaindns.backup; then
  echo "backup system dns"
  cp /etc/resolv.conf /etc/resolv.conf_systemmaindns.backup
fi


# Write new DNS servers to resolv.conf
cat <<EOL > /etc/resolv.conf
# Updated DNS servers
nameserver 178.22.122.100
nameserver 185.51.200.2
EOL

echo "DNS servers updated to 178.22.122.100 and 185.51.200.2"
