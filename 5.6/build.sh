#!/usr/bin/env sh

enableExtension()
{
    echo "$1: Enabled"
    if [ ! -f /usr/local/etc/php/conf.d/docker-php-ext-$1.ini ]; then
        docker-php-ext-enable $1 > /dev/null
    fi
}

disableExtension()
{
    echo "$1: Disabled"
    if [ -f /usr/local/etc/php/conf.d/docker-php-ext-$1.ini ]; then
        rm -f /usr/local/etc/php/conf.d/docker-php-ext-$1.ini
    fi
}

# $1 = extension; $2 = bool
setExtensionStatus()
{
    # If variable does not exist
    if [ "$(echo "$2")" == '' ]; then
        disableExtension $1
    else
        if [ $2 == true ] || [ $2 == 1 ]; then
            enableExtension $1
        else
            disableExtension $1
        fi
    fi
}

# Extensions
setExtensionStatus pdo_mysql "$EXT_PDO_MYSQL"
setExtensionStatus xdebug "$EXT_XDEBUG"
setExtensionStatus redis "$EXT_REDIS"
setExtensionStatus mcrypt "$EXT_MCRYPT"
setExtensionStatus zip "$EXT_ZIP"
setExtensionStatus intl "$EXT_INTL"
setExtensionStatus imagick "$EXT_IMAGICK"
setExtensionStatus gd "$EXT_GD"
setExtensionStatus soap "$EXT_SOAP"
setExtensionStatus opcache "$EXT_OPCACHE"
setExtensionStatus sockets "$EXT_SOCKET"

if [ "$(echo "$CRONTAB")" != '' ]; then
    if [ $CRONTAB == true ] || [ $CRONTAB == 1 ]; then
        crontab /srv/crontab.txt
        echo "crontab: Enabled"
    else
        echo "crontab: Disabled"
    fi
else
    echo "crontab: Disabled"
fi
