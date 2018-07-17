# Docker PHP-FPM
Comes with a few general PHP Extensions which need to be enabled individually via environment variables. To learn more about how to use environment variables, see [Docker Compose documentation](https://docs.docker.com/compose/environment-variables/) or the [Docker documentation](https://docs.docker.com/engine/reference/run/#env-environment-variables).

Build are available at https://hub.docker.com/r/wiejeben/php

## PHP Extensions (disabled by default):
- PDO MySQL: `EXT_PDO_MYSQL`
- Xdebug: `EXT_XDEBUG`
- Redis: `EXT_REDIS`
- ZIP: `EXT_ZIP`
- Intl: `EXT_INTL`
- Imagick `EXT_IMAGICK`
- Mcrypt: `EXT_MCRYPT` (Depricated in 7.2)
- GD: `EXT_GD`
- SOAP: `EXT_SOAP`
- OPcache: `EXT_OPCACHE`
- Sockets: `EXT_SOCKET`
- iconv: Enabled by default

Note: PHP 5.4 and 5.5 do not include any PHP extensions, this is simply a reference to cytopia his PHP-FPM packages since PHP officially does not support 5.4 and 5.5 anymore.

## Crontab
If you want to enable Crontab, build your image with `ARG CRONTAB=1` and copy your crontab file to `/srv/crontab.txt`. This is again only supported for 5.6 and up.

## Suggestions
Hit me up on Twitter @Wiejeben, create an issue or preferrably create a pull request with suggestions!
