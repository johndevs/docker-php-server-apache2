FROM ubuntu:14.10
MAINTAINER John Ahlroos

RUN apt-get update && apt-get install apache2 libapache2-mod-php5 -y

EXPOSE 80

ADD ./conf/apache.conf /etc/apache2/sites-available/000-default.conf

VOLUME /var/www

RUN a2enmod rewrite

CMD ["apache2ctl", "-e", "info", "-DFOREGROUND"]


