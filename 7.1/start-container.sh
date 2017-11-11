#!/usr/bin/env sh

if [ "$XDEBUG_ENABLE" == true ] || [ "$XDEBUG_ENABLE" == 1 ]; then
    # Enable Xdebug
    docker-php-ext-enable xdebug
else
    # Disable Xdebug
    if [ -e /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini ]; then
        rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
    fi
fi

if [ "$REDIS_ENABLE" == true ] || [ "$REDIS_ENABLE" == 1 ]; then
    # Enable Redis
    docker-php-ext-enable redis
else
    # Disable Redis
    if [ -e /usr/local/etc/php/conf.d/docker-php-ext-redis.ini ]; then
        rm -f /usr/local/etc/php/conf.d/docker-php-ext-redis.ini
    fi
fi

# Start FPM
php-fpm