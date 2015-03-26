#!/bin/bash
set -e

gpasswd -a www-data nagios
mkdir -p /var/run/icinga2/cmd
chown -R nagios:nagios /var/run/icinga2
#chown -R nagios:www-data /var/run/icinga2/cmd
#chmod g+rwx /var/run/icinga2/cmd
exec "$@"
