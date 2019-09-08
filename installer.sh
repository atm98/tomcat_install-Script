#!/bin/bash
apt -y update
echo "updated Done"
apt -y install default-jdk
echo "jdk install  Done"
useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
echo "user creation Done"
wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz -P /tmp
echo "tomcat download Done"
tar xf /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat
echo "unzip Done"
sudo ln -s /opt/tomcat/apache-tomcat-9.0.24 /opt/tomcat/latest
echo "link established"
sudo chown -RH tomcat: /opt/tomcat/latest
echo "owner change Done"
sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
echo "file made executable Done"
cat data.txt > /etc/systemd/system/tomcat.service
systemctl daemon-reload
systemctl start tomcat
systemctl enable 
ufw enable
ufw allow 8080/tcp
ufw allow ssh
systemctl status tomcat
