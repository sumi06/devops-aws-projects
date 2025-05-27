#!/bin/bash

# Update and install Java + Tomcat
apt-get update -y
apt-get upgrade -y
apt-get install -y openjdk-17-jdk tomcat10 tomcat10-admin tomcat10-docs tomcat10-common git

# Start and enable Tomcat
systemctl enable tomcat10
systemctl start tomcat10