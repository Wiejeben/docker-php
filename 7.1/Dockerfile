FROM php:7.1-fpm-alpine

# PDO
ARG EXT_PDO_MYSQL=0
RUN docker-php-ext-install pdo pdo_mysql && apk add --no-cache mysql-client

# Mcrypt
ARG EXT_MCRYPT=0
RUN apk add --no-cache libmcrypt-dev && docker-php-ext-install mcrypt

# ZIP
ARG EXT_ZIP=0
RUN apk add --no-cache zlib-dev && docker-php-ext-install zip

# Intl
ARG EXT_INTL=0
RUN apk add --no-cache icu-dev && docker-php-ext-configure intl && docker-php-ext-install intl

# Imagick
ARG EXT_IMAGICK=0
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && pecl install imagick-stable \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

# Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Redis
ARG EXT_REDIS=0
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install redis \
    && rm -rf /tmp/pear \
    && apk del .phpize-deps

# Xdebug
ARG EXT_XDEBUG=0
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install xdebug-stable \
    && apk del .phpize-deps

# GD
ARG EXT_GD=0
RUN apk add --no-cache libpng-dev && docker-php-ext-install gd

# SOAP
ARG EXT_SOAP=0
run apk add --no-cache libxml2-dev && docker-php-ext-install soap

# Setup working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# # Copy scripts and configuration
COPY php.ini /usr/local/etc/php/conf.d/php-default.ini
COPY build.sh /usr/local/bin/docker-build

RUN ["docker-build"]

CMD ["php-fpm"]
