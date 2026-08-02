# AGENTS.md

**valkyrja `valkyrja-benchmarking-php`** — the benchmark harness. It installs
Valkyrja and several other PHP frameworks on one server, sends the same load to
each one, and records the results.

This is **not** a framework code repo. It holds shell scripts and server
configuration, so only part of the canonical guide applies.

## Read first

**Cross-language canonical** —
<https://github.com/valkyrjaio/architecture/blob/master/AGENTS.md>

It governs the parts that **do** apply here:

- The `[Root] type:` commit and PR-title format.
- The branch → commit → push → open-PR workflow, with confirmation before each
  write action.
- The current-working-branch policy. This repo has no `??.x` branch, so the
  policy falls back to `master`. Branch off `master`, and base each pull request
  on `master`.
- Simplified Technical English in every document.
- Trailing newlines, and American English.
- The copyright header, on every program file. See the [Copyright
  header](#copyright-header) section below.

## What does NOT apply

This repo holds no Valkyrja PHP source, so the PHP Layer-2 guide does not govern
it. Ignore the framework-specific sections of the canonical guide:

- The structure and naming taxonomy — contracts, providers, throwables, and the
  `Abstract\`, `Enum\`, and `Contract\` segments.
- The provider conventions and the binding-key conventions.
- The 100% line-and-branch coverage rule. The harness runs no test suite.
- The PHP CI gate — PHPStan, Psalm, PHPUnit, PHP CS Fixer, PHPArkitect, and
  Rector. This repo runs none of them.

## What this repo holds

- **One directory per framework** — `valkyrja/`, `laravel/`, `symfony/`,
  `slim/`, `lumen/`, `silex/`, `codeigniter/`, and `zend/`. Each directory holds
  that framework's `install.sh`, `setup.sh`, `warmup.sh`, `benchmarks.sh`,
  `benchmarks-output.sh`, and `nginx.conf`. Two directories hold more than that
  set: `valkyrja/routes/` holds `default.php`, and `laravel/config/` holds
  `.env`.
- **The top-level scripts** — `install.sh` and `install-server.sh` prepare the
  server. `setup.sh`, `warmup.sh`, `benchmarks.sh`, and `benchmarks-output.sh`
  run the benchmark across every framework. `restart-services.sh` restarts the
  services.
- **`benchmarking/libs/output.php`** — the output helper.
- **`.github/ci/copyright-header/config`** — the package identifier and the
  excluded files that the copyright header check reads.
- **`RESULTS.md`** — the recorded results.

Each framework directory repeats the same six file names. A change to a step in
one framework usually needs the same change in every other framework. Keep the
set consistent.

A framework directory is not always interchangeable with another one. The
`routes/` directory and the `config/` directory above are the exception, and
only one framework reads each of them.

## Warning — read the assumptions before you change a script

The `README.md` lists the assumptions that the scripts make about the server:
the paths, the web server, the PHP version, and the installed tools. A script
here is not portable, and it writes outside the repo. Read the assumptions
first, then change the script.

The scripts write to `/var/www`, to the Nginx configuration, and to the hosts
file. Never run a script from this repo against your own machine to test a
change.

## Copyright header

Every program file in this repo carries the copyright header. A shell script and
a PHP file are program files. The package identifier is `Valkyrja Benchmarking`.
`COPYRIGHT_HEADER.md` in the `.github` repo holds the identifier for every repo,
and it is the source of truth for the header text.

A PHP file writes the header as a block comment, after the open tag:

```php
<?php

/*
 * This file is part of the Valkyrja Benchmarking package.
 *
 * Copyright (c) 2016-present Melech Mizrachi
 *
 * Released under the MIT License. See LICENSE.md for details.
 */
```

A shell script writes the same text as a line comment, after the shebang:

```bash
#!/bin/bash
#
# This file is part of the Valkyrja Benchmarking package.
#
# Copyright (c) 2016-present Melech Mizrachi
#
# Released under the MIT License. See LICENSE.md for details.
#
```

A file that holds no program code carries no header. A document, a workflow, and
a configuration file are such files. Each `nginx.conf` and `laravel/config/.env`
carry none.

The `_copyright-header-check.yml` workflow in the `.github` repo enforces the
rule, and the `copyright-header-check` job in `ci.yml` calls it. The check reads
every tracked file, and it requires the header in each file that the `EXCLUDED`
list does not match. This repo states only what is its own, in
`.github/ci/copyright-header/config`: the `IDENTIFIER`, and the `EXCLUDED` array.
The `.github` repo holds the check itself, so every repo in the organization runs
one implementation.

Warning: a new file fails the check until a person acts. Add the header to the
file, or add the file to `EXCLUDED` when the file holds no program code. The
`config` file is a tracked file too, so it carries the header as a line comment.

Warning: the check reads `git ls-files`, so an untracked file is invisible to it.
Stage a new file before you expect the check to see it.

## CI

The gate here checks files, not code. `ci.yml` runs the trailing newline check,
the Markdown check, and the copyright header check. `pr.yml` runs the commit
message check.

## Roots

Most relevant here: `[Results]`, the framework under test (`[Laravel]`,
`[Symfony]`, `[Slim]`, and so on), `[Nginx]`, `[Workflow]`, `[GitHub]`, and
`[Git]`.

**`[Benchmark]` is not a root in this repo.** A root is never the repo's own
identity, and this repo _is_ the benchmark, so the name says nothing here. Name
the framework or the step instead. `[Benchmark]` stays correct in another repo,
where a benchmark genuinely stands out.
