#/usr/bin/bash

yum install wget java11-openjdk-devel unzip -y

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.7.1.62043.zip
unzip sonarqube-9.7.1.62043.zip -d /opt/
mv /opt/sonarqube-9.7.1.62043 /opt/sonarqube

useradd sonar
chown -R sonar:sonar /opt/sonarqube

touch /etc/systemd/system/sonar.service

echo > /etc/systemd/system/sonar.service
cat << EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube Service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always

[Install]
WantedBy=multi-user.target
EOT

service sonar start
service sonar enable

# instalar Sonar Scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
mv /opt/sonar-scanner-4.7.0.2747-linux /opt/sonar-scanner

chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile

apt install nodejs
apt install npm
