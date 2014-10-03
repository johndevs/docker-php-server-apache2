FROM ubuntu:14.10
MAINTAINER John Ahlroos

RUN apt-get update && apt-get install apache2 libapache2-mod-php5 php5-curl php5-gd php5-sqlite3 -y

EXPOSE 80

ADD ./conf/apache.conf /etc/apache2/sites-available/000-default.conf
ADD ./conf/php.ini /etc/php5/apache2/php.ini

VOLUME /var/www

RUN a2enmod rewrite

CMD ["apache2ctl", "-e", "info", "-DFOREGROUND"]


