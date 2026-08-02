<?php

/*
 * This file is part of the Valkyrja Benchmarking package.
 *
 * Copyright (c) 2016-present Melech Mizrachi
 *
 * Released under the MIT License. See LICENSE.md for details.
 */

// Only run if needed
if (isset($_GET['benchmark'])) {
    $memory = memory_get_peak_usage();
    $time = microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'];

    file_put_contents(
        '/var/www/benchmarks/' . explode('/', realpath('./'))[3],
        sprintf(
            "%' 8d:%f:%d\n\n%s",
            $memory,
            $time,
            // One less than total because this file was included
            count(get_included_files()) - 1,
            implode("\n", get_included_files())
        )
    );
}
