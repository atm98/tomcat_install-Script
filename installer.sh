#!/bin/bash
sudo su
apt -y update
apt -y install default-jdk
useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz -P /tmp
tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.14 /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
touch /etc/systemd/system/tomcat.service
cat data.txt > /etc/systemd/system/tomcat.service
systemctl daemon-reload
systemctl start tomcat
systemctl status tomcat
systemctl enable 
ufw enable
ufw allow 8080/tcp
