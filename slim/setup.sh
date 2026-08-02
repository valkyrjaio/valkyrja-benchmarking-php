#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/slim/framework

git clone https://github.com/slimphp/Slim-Skeleton.git /var/www/slim/framework

cd /var/www/slim/framework

composer install --no-dev --optimize-autoloader
chmod -R 777 logs/

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/slim/framework/public/index.php
