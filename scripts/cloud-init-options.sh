#!/usr/bin/env bash
set -e

# Disable cloud-init repo updates or upgrades
packages="awslogs"

# Exclude Docker and ECS Agent from update
sudo sed -i -e '/^repo_update: /{h;s/: .*: false/};${x;/^$/{s//repo_update: false/;H};x}' /etc/cloud/cloud.cfg
sudo sed -i -e '/^repo_upgrade: /{h;s/: .*: none/};${x;/^$/{s//repo_upgrade: none/;H};x}' /etc/cloud/cloud.cfg