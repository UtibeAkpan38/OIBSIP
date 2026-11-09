#!/bin/bash
# UFW configuration script
# Applies the firewall rules in sequence

# Set the default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH (port 22)
sudo ufw allow ssh

# Deny HTTP (port 80)
sudo ufw deny http

# Allow HTTPS (port 443)
sudo ufw allow https

# Deny a specific IP range (documentation range, used for testing)
sudo ufw deny from 203.0.113.0/24

# Enable the firewall
sudo ufw --force enable

# Show the active rules
sudo ufw status verbose
