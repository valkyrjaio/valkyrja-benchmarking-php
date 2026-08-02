#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/silex/framework

git clone https://github.com/silexphp/Silex-Skeleton.git /var/www/silex/framework

cd /var/www/silex/framework

composer install --no-dev --optimize-autoloader

chmod -R 777 var/

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/silex/framework/web/index.php
