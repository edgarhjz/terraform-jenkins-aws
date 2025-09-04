#!/bin/bash

# ====================================================================================
#
#          FILE: deploy_jenkins.sh
#
#         USAGE: ./deploy_jenkins.sh
#
#   DESCRIPTION: Installs the Jenkins LTS (Long-Term Support) server on an
#                Ubuntu 24.04 system. It also installs Java, which is a
#                necessary dependency.
#
#        AUTHOR: Edgar Hernandez
#       CREATED: 2024-05-16
#
# ====================================================================================

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Jenkins LTS Installation on Ubuntu 24.04 ---"

# ------------------------------------------------------------------------------------
# Step 1: Install Java (Jenkins requires Java to run)
# We will install OpenJDK 17, which is a commonly used version for modern Jenkins.
# ------------------------------------------------------------------------------------
echo "[INFO] Step 1: Updating package list and installing Java..."
sudo apt-get update
sudo apt-get install -y openjdk-17-jre
echo "[SUCCESS] Java installed successfully."

# ------------------------------------------------------------------------------------
# Step 2: Add the Jenkins repository GPG key
# This key is used to verify the integrity of the Jenkins packages.
# ------------------------------------------------------------------------------------
echo "[INFO] Step 2: Adding Jenkins repository GPG key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "[SUCCESS] GPG key added."

# ------------------------------------------------------------------------------------
# Step 3: Add the Jenkins APT repository to the system's sources list
# This tells the 'apt' package manager where to download Jenkins from.
# ------------------------------------------------------------------------------------
echo "[INFO] Step 3: Adding Jenkins APT repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "[SUCCESS] Jenkins repository added."

# ------------------------------------------------------------------------------------
# Step 4: Update the package list and install Jenkins
# Now that the new repository is added, we update the list of available packages.
# Then, we install Jenkins itself.
# ------------------------------------------------------------------------------------
echo "[INFO] Step 4: Updating package list and installing Jenkins..."
sudo apt-get update
sudo apt-get install -y jenkins
echo "[SUCCESS] Jenkins installation command executed."

# ------------------------------------------------------------------------------------
# Step 5: Enable and Start the Jenkins service
# This ensures Jenkins starts on boot and is running now.
# ------------------------------------------------------------------------------------
echo "[INFO] Step 5: Enabling and starting the Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "[SUCCESS] Jenkins service started and enabled."

# ------------------------------------------------------------------------------------
# Final Step: Display status and next steps
# ------------------------------------------------------------------------------------
echo ""
echo "--- Jenkins Installation Complete ---"
echo ""

# Check if Jenkins is active
sudo systemctl status jenkins --no-pager

# Provide instructions for the user
echo "Your Jenkins server should now be running on port 8080."
echo "You can access it at: http://<your_server_ip>:8080"
echo ""
echo "The initial administrator password is located at:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo ""