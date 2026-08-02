#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#

ab -n 10 -c 3 http://lumen.localhost/
ab -n 10 -c 3 http://lumen.localhost/
ab -n 10 -c 3 http://lumen.localhost/
