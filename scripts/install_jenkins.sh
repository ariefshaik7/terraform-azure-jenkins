#!/bin/bash
set -e  # Exit immediately if any command fails

# Install prerequisites
sudo apt-get update -y
sudo apt-get install -y openjdk-17-jdk wget

# Add Jenkins repository (new method as of 2023)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /etc/apt/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# Start and enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install common CI tools
sudo apt-get install -y git maven

# Output initial admin password
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword