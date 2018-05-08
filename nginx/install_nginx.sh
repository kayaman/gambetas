#!/usr/bin/env bash

# Ubuntu - as per https://www.nginx.com/blog/setting-up-nginx/

sudo wget http://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

sudo echo "deb http://nginx.org/packages/ubuntu xenial nginx" >> /etc/apt/sources.list
sudo echo "deb-src http://nginx.org/packages/ubuntu xenial nginx" >> /etc/apt/sources.list

sudo apt-get update
sudo apt-get install nginx
sudo service nginx start

