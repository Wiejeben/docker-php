FROM php:7.2-fpm-alpine

# PDO
RUN docker-php-ext-install pdo pdo_mysql

# ZIP
RUN apk add --no-cache zlib-dev && docker-php-ext-install zip

# Intl
RUN apk add --no-cache icu-dev && docker-php-ext-configure intl && docker-php-ext-install intl

# Imagick
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && pecl install imagick-stable \
    && docker-php-ext-enable imagick \
    && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps

# Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Redis
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install redis \
    && rm -rf /tmp/pear \
    && apk del .phpize-deps

# Xdebug (beta for 7.2 support)
RUN set -x \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && pecl install xdebug-2.6.0beta1 \
    && apk del .phpize-deps

# Iconv
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# Setup working directory
RUN mkdir /srv/app && chown -R www-data:www-data /srv/app
WORKDIR /srv/app

# Copy scripts and configuration
COPY php.ini /usr/local/etc/php/conf.d/php-default.ini
COPY run.sh /usr/local/bin/docker-script

CMD ["docker-script"]
