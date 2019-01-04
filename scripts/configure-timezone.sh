#!/usr/bin/env bash
set -e

#configure host to use timezone
# http://docs.aws.amazon.com/awsec2/latest/userguide/set-time.html
timezone=${TIME_ZONE:-America/Los_Angeles}

echo "### Setting timezone to $timezone ###"
sudo tee /etc/sysconfig/clock << EOF > /dev/null
ZONE="$timezone"
UTC=true
EOF

sudo ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

#enable NTP
sudo chkconfig ntpd on
