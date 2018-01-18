# Docker PHP-FPM
Added a few basic packages which need to be enabled individually via environment variables. To learn more about how to use environment variables, see [Docker Compose documentation](https://docs.docker.com/compose/environment-variables/) or the [Docker documentation](https://docs.docker.com/engine/reference/run/#env-environment-variables).

## PHP extensions (disabled by default):
- PDO MySQL: `EXT_PDO_MYSQL`
- Xdebug: `EXT_XDEBUG`
- Redis: `EXT_REDIS`
- ZIP: `EXT_ZIP`
- Intl: `EXT_INTL`
- Imagick `EXT_IMAGICK`
- Mcrypt: `EXT_MCRYPT` (Depricated in 7.2)


## Suggestions
Hit me up on Twitter @Wiejeben, create an issue or preferrably create a pull request with suggestions!
