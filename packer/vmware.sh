#!/bin/bash -eux

echo "==> Installing VMware Tools"
sudo apt-get install open-vm-tools-desktop
rm /home/${SSH_USERNAME}/*.iso

echo "==> Installed VMware Tools"