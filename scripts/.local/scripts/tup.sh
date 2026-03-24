#!/bin/zsh

echo "This shell-script requires sudo privileges to run."
sudo -v
sudo systemctl start tailscaled.service
sudo tailscale up
sudo -k