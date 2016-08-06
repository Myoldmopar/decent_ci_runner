#!/bin/bash -eux

echo "Username: '$SSH_USERNAME'"
apt-get update
apt-get -y upgrade
apt-get -y --no-install-recommends install ubuntu-desktop curl gnome-terminal indicator-session unity-lens-applications
bash <(wget -O - https://raw.githubusercontent.com/lefticus/decent_ci_runner/security_enhancements/setup_ci.sh) true true false
bash <(wget -O - https://raw.githubusercontent.com/lefticus/decent_ci_runner/security_enhancements/setup_ci.sh) true true false
apt-get clean
cp /tmp/decent_ci_config.yaml /usr/local/etc/decent_ci_config.yaml