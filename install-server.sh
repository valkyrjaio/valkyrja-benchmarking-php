#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

apt-get -y install software-properties-common

add-apt-repository ppa:ondrej/php

apt-get update

apt-get -y --reinstall --allow-unauthenticated install nginx

apt-get -y --reinstall --allow-unauthenticated install php7.4

# Install php7.4-fpm with needed extensions
apt-get -y --reinstall --allow-unauthenticated install php7.4-fpm
apt-get -y --reinstall --allow-unauthenticated install php7.4-cli
apt-get -y --reinstall --allow-unauthenticated install php7.4-common
apt-get -y --reinstall --allow-unauthenticated install php7.4-json
apt-get -y --reinstall --allow-unauthenticated install php7.4-opcache
#apt-get -y --reinstall --allow-unauthenticated install php7.4-mysql
apt-get -y --reinstall --allow-unauthenticated install php7.4-phpdbg
apt-get -y --reinstall --allow-unauthenticated install php7.4-mbstring
#apt-get -y --reinstall --allow-unauthenticated install php7.4-imap
#apt-get -y --reinstall --allow-unauthenticated install php7.4-ldap
#apt-get -y --reinstall --allow-unauthenticated install php7.4-pgsql
#apt-get -y --reinstall --allow-unauthenticated install php7.4-pspell
#apt-get -y --reinstall --allow-unauthenticated install php7.4-recode
#apt-get -y --reinstall --allow-unauthenticated install php7.4-tidy
apt-get -y --reinstall --allow-unauthenticated install php7.4-dev
#apt-get -y --reinstall --allow-unauthenticated install php7.4-intl
apt-get -y --reinstall --allow-unauthenticated install php7.4-gd
apt-get -y --reinstall --allow-unauthenticated install php7.4-curl
apt-get -y --reinstall --allow-unauthenticated install php7.4-zip
apt-get -y --reinstall --allow-unauthenticated install php7.4-xml
#apt-get -y --reinstall --allow-unauthenticated install php-xdebug

./install.sh
