#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

./codeigniter/install.sh
./laravel/install.sh
./lumen/install.sh
./silex/install.sh
./slim/install.sh
./symfony/install.sh
./valkyrja/install.sh
./zend/install.sh

mkdir ./benchmarks/
chmod -R 777 ./benchmarks/

./restard-services.sh
