#!/bin/bash

# Update package list
sudo yum update -y

# Install Apache HTTPD
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Move your app files (assuming they are already copied via GitHub Action)
sudo mv /home/ec2-user/index.html /var/www/html/index.html
sudo systemctl restart httpd

# Install Grafana (for Amazon Linux 2 / RHEL-based systems)
sudo tee /etc/yum.repos.d/grafana.repo<<EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
EOF

sudo yum install -y grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "✅ HTTPD and Grafana installation complete!"
