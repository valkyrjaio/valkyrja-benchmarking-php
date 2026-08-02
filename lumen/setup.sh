#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/lumen/framework

git clone https://github.com/laravel/lumen.git /var/www/lumen/framework

cd /var/www/lumen/framework

composer install --no-dev --optimize-autoloader

chmod o+w storage/*
chmod o+w storage/framework/*

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/lumen/framework/public/index.php
