<?php

/*
 * This file is part of the Valkyrja Benchmarking package.
 *
 * Copyright (c) 2016-present Melech Mizrachi
 *
 * Released under the MIT License. See LICENSE.md for details.
 */

use App\Http\Controllers\HomeController;
use Valkyrja\Http\ResponseFactory;
use Valkyrja\Routing\Collector;

\Valkyrja\collector()->withController(HomeController::class)->withName('home')->group(
    static function (Collector $collector) {
        /**
         * Welcome Route.
         * - Example of a view being returned
         *
         * @path /
         */
        $collector->get('/', '->welcome()', 'welcome');

        /**
         * Framework Version Route.
         * - Example of string being returned
         *
         * @path /version
         */
        $collector->get('/version', '::version()', 'version');
    }
);
