FROM library/debian:stretch
MAINTAINER joan.meya@globalzitro.com

RUN 	apt-get update && \
	apt-get install libapache2-mod-php7.0 --yes && \
	rm -rf /var/lib/dpkg /var/lib/apt /var/cache/apt /var/www/html/index.html && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/stdout /var/log/apache2/error.log
	

ADD index.html /var/www/html/

ENTRYPOINT 	[ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
#CMD [ "-D FOREGROUND" ]
#EXPOSE 80

