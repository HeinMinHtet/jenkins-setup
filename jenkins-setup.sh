#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install Java (Jenkins requires Java 17 or 21)
sudo apt-get install fontconfig openjdk-17-jre -y

# Import the Jenkins GPG key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins repository to the system
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
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
