#!/bin/bash
#Date: Feb 2023
#Description: Script for sonarqube installation on centos

########################################
echo "Updating the system...."
sleep 3
sudo yum update -y
#######################################
echo "Java 11 installation..."
sleep 3
sudo yum install java-11-openjdk-devel -y
if [ $? -eq o ]
then 
echo "Java installed successfully"
else
echo "Java failed to install"
#########################################
echo "Downloading Sonarqube latest version..."
sleep 3
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
if [ $? -eq o ]
then 
echo "sonarqube downloaded successfully"
else
echo "sonarqube failed to download"
##############################################
echo "extracting packages....."
sleep 3
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
if [ $? -eq o ]
then 
echo "sonarqube extracted successfully"
else
echo "sonarqube failed to extract"
##############################################
echo "changing ownership and switching to linux binaries..."
sleep 3
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/
 ./sonarqube.sh start
 if [ $? -eq o ]
then 
echo "sonarqube started successfully"
else
echo "sonarqube failed to start"
##################################################