# SunGrower for [Home Assistant](https://www.home-assistant.io/).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

Based on original GoSunGrow addon by MickMake. Plugin refreshed for HA/Lovelace usage by zk/master-data.

## Configuration and installation
Make sure that you have properly configured MQTT Broker. Restart after setting up. You might need to allow anonymous access, create a new user and customize Mosquitto options - including account access controls.

Add this GitHub repository as a custom repo in the HA UI, https://github.com/master-data/HomeAssistantAddOns. If you want to use local addon, add "SunGrower" directory to addons/ by SMB or SSH.

To get new and current versions, always "Check updates for all addons".

When your preferred way to to install the plugin has been found, please set the config options properly. If you fail to start, please reboot HA and asses that you really have MQTT, IPs and such working and settled.

If something is not working, please check your MQTTs, configuration options and reboot. And try again. This is not going to be my faulta. Seriously.

Just concentrate on getting these done:

- sungrow_user (iSolarCloud account user)
- sungrow_password (iSolarCloud account password)
- sungrow_mqtt_host (your HA local IP, not localhost)
- sungrow_mqtt_port (1883)
- sungrow_mqtt_user (create one and configure in MQTT Broker)
- sungrow_mqtt_password (required)
- sungrow_host (pick the one that works - https://gateway.isolarcloud.eu / https://augateway.isolarcloud.com / https://gateway.isolarcloud.com / https://gateway.isolarcloud.com.hk)

## About GoSunGrow
See the docs here [GoSunGrow](https://github.com/MickMake/GoSunGrow/)
