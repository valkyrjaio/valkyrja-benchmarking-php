# Benchmarks

## Assumptions

This project makes a few assumptions:

1. You have a server upon which you wish to benchmark
2. You have Nginx installed
3. You have a /var/www/ folder from which you run your sites
4. Your Nginx sites-enabled directory lives here "/etc/nginx/sites-enabled/"
5. Your hosts file lives here "/etc/hosts/"
6. You have a default sites-enabled setup for Nginx
7. You're running PHP 7.1
8. You're running PHP 7.1 FPM with Nginx
9. You have git installed
10. You've got composer installed and configured to be used in this manner "composer <command> [options]"
11. You're running opcache (for the best results)
12. You have ab installed

### Don't meet those assumptions?

If your server does not meet these requirements please use the "install-server.sh" file over the "install.sh" file

Note: If you choose to use "install-server.sh" there is one major assumption; You are running a version of Linux with apt-get support

## Usage

Using this project is quite simple. Follow these steps:

1. Install this repo into your server via "git clone https://github.com/valkyrjaio/valkyrja-benchmarking-php.git /var/www"
2. Run "./install.sh" OR "./install-server.sh" depending on your server meeting the aforementioned assumptions.
3. Run "./warmup.sh" to warmup the opcache and get the best results.
4. At this stage it is recommended you check the Nginx error log to ensure everything was setup properly and running appropriately "cat /var/log/nginx/error.log"
5. It is recommended you clear your CLI window at this stage in order to have only the results of the next step without additional clutter "clear"
6. Run ./benchmarks.sh

- This will run "ab -c 10 -t 3 <url>" for each framework

## Our Results

We've run this on our own on two AWS servers, t2.xlarge and compiled the results to a Google Doc and Google Spreadsheet

- Google Doc: https://docs.google.com/document/d/104iLanbdctwN5rZPbvvHKm9EWgMHLci3DbNoFOheJjs/edit
- Google Spreadsheet: https://docs.google.com/spreadsheets/d/1CZr-xIzlPedE-k5naAmRTf88SOE6B8vn9GcZG3gY2WA/edit

### Results Breakdown

| Framework           | Requests/Second | Memory Usage | Time/Request | Files Loaded |
| ------------------- | --------------: | -----------: | -----------: | -----------: |
| CodeIgniter***      |         6060.19 |       411000 |     0.000595 |           27 |
| Valkyrja (version)* |         5519.52 |       401016 |     0.001483 |           85 |
| Valkyrja            |         4957.28 |       421152 |     0.001768 |           96 |
| Lumen* **           |         4621.90 |       710792 |     0.003474 |           79 |
| Slim* **            |         4139.95 |       599536 |     0.001786 |          126 |
| Silex               |         2916.24 |       740792 |     0.002506 |          146 |
| Symfony             |         1865.81 |      1343984 |     0.004068 |          312 |
| Zend                |         1823.19 |      1179304 |     0.003806 |          204 |
| Laravel             |          960.37 |      2204160 |     0.006106 |          277 |

- \* Does not render view
- \*\* Does not dispatch to controller
- \*\*\* No Composer autoloader
