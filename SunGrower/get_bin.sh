#!/usr/bin/with-contenv bashio
set -e

ARCH="$(uname -m)"
case "${ARCH}" in
	'amd64'|'x86_64')
		ARCH="amd64"
		;;

	'aarch64'|'armhf'|'armv7'|'arm64')
		ARCH="arm64"
		;;

	*)
		bashio::log.error "Architecture not supported"
		exit 1
esac

FILE="https://github.com/MickMake/GoSungrow/releases/download/v2.2.0/GoSungrow-linux_${ARCH}.tar.gz"

bashio::log.info "Fetching ${FILE}"

wget -O- ${FILE} | tar zxvf - GoSungrow

chmod a+x /GoSungrow
