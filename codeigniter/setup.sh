#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

rm -rf /var/www/codeigniter/framework

git clone https://github.com/bcit-ci/CodeIgniter.git /var/www/codeigniter/framework

cd /var/www/codeigniter/framework

composer install --no-dev --optimize-autoloader

echo "require '/var/www/benchmarking/libs/output.php';" >> /var/www/codeigniter/framework/index.php
