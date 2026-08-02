#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

sudo echo "127.0.0.1 lumen.localhost" >> /etc/hosts

sudo cp /var/www/lumen/nginx.conf /etc/nginx/sites-enabled/lumen

./setup.sh
