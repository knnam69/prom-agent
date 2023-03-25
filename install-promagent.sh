#! /bin/bash

cd /tmp/
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar -xvzf node_exporter-1.5.0.linux-amd64.tar.gz
useradd --no-create-home --shell /bin/false nodeusr
cp node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/
chown nodeusr:nodeusr /usr/local/bin/node_exporter
wget https://raw.githubusercontent.com/knnam69/prom-agent/main/node_exporter.service
cp node_exporter.service /etc/systemd/system/
systemctl daemon-reload && systemctl enable node_exporter && systemctl start node_exporter && systemctl status node_exporter
firewall-cmd --permanent --zone=public --add-port=9100/tcp && firewall-cmd --reload
