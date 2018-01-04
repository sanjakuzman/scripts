#!/bin/bash

# Add apt repository
sudo apt-get update && sudo apt-get install -y
yes "" | sudo add-apt-repository ppa:webupd8team/java

# Accept licence and install java
sudo apt-get update 
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Download, unzip, configure and install maven
cd /opt/ && sudo wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz
sudo mv apache-maven-3.3.9 maven
sudo echo -e "export M2_HOME=/opt/maven\nexport PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/mavenenv.sh && chmod +x /etc/profile.d/mavenenv.sh && source /etc/profile.d/mavenenv.sh
sudo apt-get install -y maven 
