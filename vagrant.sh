#!/usr/bin/bash

echo "Installing Apache and setting up..."
yum install -y httpd >/dev/null 2>&1

echo "Copy html_content to /var/www/html"
cp -r /vagrant/html/* /var/www/html/

echo "Starting Apache Http Server..."
service httpd start