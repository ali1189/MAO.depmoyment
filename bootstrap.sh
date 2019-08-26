#!/bin/bash

# Update the system
# echo "Updating system"
# yum update -y 

# Install some packages
echo "Installing important packages"
yum install -y redhat-lsb-core net-tools bind-utils wget

# Enable password authentication for fast recap
echo "Enabling password authentication in sshd config"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Disable SELinux
echo "Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Set Root password for fast recap
echo "Set root password"
echo "ali" | passwd --stdin root >/dev/null

# start  firewalld
echo "start firewalld"
systemctl start firewalld
