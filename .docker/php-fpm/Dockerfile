ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-fpm

RUN apt-get update 

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions spl mbstring iconv json gd zip mysqli pdo_mysql xdebug

WORKDIR /var/www/webasyst