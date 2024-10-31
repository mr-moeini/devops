#!/bin/bash

# Update the system packages
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl

# Add Aliyun  repository
sudo curl -fsSL https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF'

# Update the package list
sudo apt-get update

# Install Kubernetes components
sudo apt install -y kubelet kubeadm kubectl

# Hold kubernetes to prevent automatic updates
sudo apt-mark hold kubelet kubeadm kubectl

# Enable and start kubelet service
sudo systemctl enable kubelet && sudo systemctl start kubelet

echo "Kubernetes has been installed"
