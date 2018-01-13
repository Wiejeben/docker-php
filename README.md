# Docker PHP-FPM images
Added only a few PHP packages to focus on performance. Disabled PHP dependencies can be enabled via environmental variables.

Included PHP dependencies:
- PDO
- Mcrypt (depricated in PHP 7.2)
- ZIP
- Intl
- Imagick
- Composer
- Iconv
- Redis (Disabled by default: `REDIS_ENABLE`)
- Xdebug (Disabled by default: `XDEBUG_ENABLE`)

Suggestions are always welcome!
