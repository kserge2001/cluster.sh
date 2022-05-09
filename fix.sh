#!/bin/bash

sed -e 's/SystemdCgroup = false/SystemdCgroup = true/g' -i /etc/containerd/config.toml
systemctl daemon-reload
systemctl restart containerd
systemctl restart kubelet
