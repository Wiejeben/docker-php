FROM php:7.1-fpm-alpine

# EXT_PDO_MYSQL
RUN docker-php-ext-install pdo pdo_mysql

# EXT_MCRYPT
RUN apk add --no-cache libmcrypt-dev && docker-php-ext-install mcrypt

# EXT_ZIP
RUN apk add --no-cache zlib-dev && docker-php-ext-install zip

# EXT_INTL
RUN apk add --no-cache icu-dev && docker-php-ext-configure intl && docker-php-ext-install intl

# EXT_IMAGICK
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && pecl install imagick-stable \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

# COMPOSER_ENABLE
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# EXT_REDIS
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install redis \
    && rm -rf /tmp/pear \
    && apk del .phpize-deps

# EXT_XDEBUG
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install xdebug-stable \
    && apk del .phpize-deps

# Setup working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# # Copy scripts and configuration
COPY php.ini /usr/local/etc/php/conf.d/php-default.ini
COPY run.sh /usr/local/bin/docker-script

CMD ["docker-script"]
