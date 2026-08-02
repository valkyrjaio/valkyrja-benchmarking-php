#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/zend/framework

git clone https://github.com/zendframework/ZendSkeletonApplication.git /var/www/zend/framework

cd /var/www/zend/framework

composer install --no-dev --optimize-autoloader

composer development-disable
chmod o+w data/cache/
rm -rf data/cache/*

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/zend/framework/public/index.php
