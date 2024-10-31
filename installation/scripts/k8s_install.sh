#!/bin/bash

# Update package
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl

# Add the repository for Ubuntu 22.04
sudo curl -fsSL https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-jammy main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package list with the new repository
sudo apt update

# Install Kubernetes components
sudo apt install -y kubelet kubeadm kubectl

# Hold packages to prevent automatic updates
sudo apt-mark hold kubelet kubeadm kubectl

# Enable and start kubelet service
sudo systemctl enable kubelet && sudo systemctl start kubelet

echo "Kubernetes have been installed successfully!"

