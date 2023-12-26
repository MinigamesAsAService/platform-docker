#!/bin/bash
set -euo pipefail

if [[ -n "${CONFIG_PATH}" ]]; then
  echo "Downloading config file from ${CONFIG_PATH}..." &&
  curl -L "${CONFIG_PATH}" -o config.zip
  echo "Unzipping file..."
  unzip config.zip
  rm config.zip
else
  echo "Please set the CONFIG_PATH environment variable."
  exit 1
fi

# TODO: Read .minigame/config.toml for configurations on gamemode, etc.
# See documentation at https://docker-minecraft-server.readthedocs.io/en/latest/configuration/server-properties

# TODO: Use paper and add plugins/mods

# Hand control back to base image
/start
