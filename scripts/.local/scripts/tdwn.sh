#!/bin/zsh

echo "This shell-script requires sudo privileges to run."
sudo -v
sudo tailscale down
sudo systemctl stop tailscaled.service
sudo -k