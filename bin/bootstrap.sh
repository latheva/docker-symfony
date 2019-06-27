#!/usr/bin/env bash

#
# PHP container bootstrap script
#
# Do not modify this file as it is tracked by source control.

echo "Starting apache web server..."

source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND


# A note on performance: It is typically better to keep this script
# light with no process-intensive operations as it will be run on every
# docker-compose up
