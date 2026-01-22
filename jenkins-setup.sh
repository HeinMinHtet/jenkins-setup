#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install Java (Jenkins requires Java 17 or 21)
sudo apt install fontconfig openjdk-21-jre -y 

# Import the Jenkins GPG key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add the Jenkins repository to the system
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update local package index and install Jenkins
sudo apt-get update -y
sudo apt-get install jenkins -y

# Start and enable Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Jenkins installation is complete."
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
