#!/usr/bin/with-contenv bashio

set -e

CONFIG_PATH=/data/options.json


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

SUNGROW_EXE="/GoSungrow_${ARCH}"

bashio::log.info "GoSungrow exe is ${SUNGROW_EXE}..."

SUNGROW_HOST="$(bashio::config 'sungrow_host')"
SUNGROW_USER="$(bashio::config 'sungrow_user')"
SUNGROW_PASSWORD="$(bashio::config 'sungrow_password')"
SUNGROW_APPKEY="$(bashio::config 'sungrow_appkey')"
SUNGROW_DEBUG="$(bashio::config 'sungrow_debug')"
SUNGROW_TIMEOUT="$(bashio::config 'sungrow_timeout')"

SUNGROW_MQTT_HOST="$(bashio::config 'sungrow_mqtt_host')"
SUNGROW_MQTT_PORT="$(bashio::config 'sungrow_mqtt_port')"
SUNGROW_MQTT_USER="$(bashio::config 'sungrow_mqtt_user')"
SUNGROW_MQTT_PASSWORD="$(bashio::config 'sungrow_mqtt_password')"

bashio::log.info "Setting up GoSungrow config ..."

#python3 -m http.server 8001

${SUNGROW_EXE} config write \
	--host="${SUNGROW_HOST}" \
	--user="${SUNGROW_USER}" \
	--password="${SUNGROW_PASSWORD}" \
	--appkey="${SUNGROW_APPKEY}" \
	--timeout="${SUNGROW_TIMEOUT}s" \
	--mqtt-host="${SUNGROW_MQTT_HOST}" \
	--mqtt-port="${SUNGROW_MQTT_PORT}" \
	--mqtt-user="${SUNGROW_MQTT_USER}" \
	--mqtt-password="${SUNGROW_MQTT_PASSWORD}" \
	--debug="${SUNGROW_DEBUG}"

bashio::log.info "Login to iSolarCloud using gateway..."

${SUNGROW_EXE} api login

bashio::log.info "Syncing data from gateway..."

# loop
while true
do
${SUNGROW_EXE} mqtt sync
sleep 1
done
