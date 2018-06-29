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
setExtensionStatus zip "$EXT_ZIP"
setExtensionStatus intl "$EXT_INTL"
setExtensionStatus imagick "$EXT_IMAGICK"
setExtensionStatus gd "$EXT_GD"
setExtensionStatus soap "$EXT_SOAP"
setExtensionStatus opcache "$EXT_OPCACHE"

if [[ "$(echo "$EXT_ICONV")" != '' ]]; then
    if [ "$EXT_ICONV" == true ] || [ "$EXT_ICONV" == 1 ]; then
        echo "iconv: Enabled"
        export LD_PRELOAD="/usr/lib/preloadable_libiconv.so php"
    else
        echo "iconv: Disabled"
    fi
else
    echo "iconv: Disabled"
fi
