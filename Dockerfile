FROM    joshuacox/docker-icinga2:wheezy
MAINTAINER Josh Cox <josh 'at' webhosting coop>

# Add supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

VOLUME  ["/var/lib/icinga2"]
VOLUME  ["/etc/icinga2"]
VOLUME  ["/etc/icinga2-classicui"]
VOLUME  ["/etc/icinga"]
VOLUME  ["/etc/icinga-web"]
VOLUME  ["/etc/dbconfig-common"]

EXPOSE 80
EXPOSE 5665

# MOUNT_FROM_HOST /exports/whc-icinga2/var/lib/icinga2 /var/lib/icinga2
# MOUNT_FROM_HOST /exports/whc-icinga2/etc/icinga2 /etc/icinga2
# MOUNT_FROM_HOST /exports/whc-icinga2/etc/icinga2-classicui /etc/icinga2-classicui
# MOUNT_FROM_HOST /exports/whc-icinga2/etc/icinga /etc/icinga
# MOUNT_FROM_HOST /exports/whc-icinga2/etc/icinga-web /etc/icinga-web
# MOUNT_FROM_HOST /exports/whc-icinga2/etc/dbconfig-common /etc/dbconfig-common
# PORTS_FROM_HOST 45664 80
# PORTS_FROM_HOST 45664 80/udp
# PORTS_FROM_HOST 5665 5665
# PORTS_FROM_HOST 5665 5665/udp
# Initialize and run Supervisor
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]
