#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/symfony/framework

git clone https://github.com/symfony/symfony-standard.git /var/www/symfony/framework

cd /var/www/symfony/framework

export SYMFONY_ENV=prod

composer install --no-dev --optimize-autoloader

php bin/console cache:clear --env=prod --no-debug
chmod -R 777 var/
chmod o+w var/cache/ var/logs/
chmod -R o+w var/cache/*

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/symfony/framework/web/app.php
