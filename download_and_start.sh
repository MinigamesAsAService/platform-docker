#!/bin/bash
set -euo pipefail

if [[ -n "${CONFIG_PATH}" ]]; then
  echo "Downloading config file from ${CONFIG_PATH}..." &&
  curl -L "${CONFIG_PATH}" -o config.zip
  echo "Unzipping file..."
  unzip config.zip
  rm config.zip
elif [[ -n "${CONFIG_REPO}" ]]; then
       git clone "${CONFIG_REPO}" .
fi

if [[ -n "${SKRIPT_PATH}" ]]; then
  echo "Downloading config file from ${SKRIPT_PATH}..." &&
  mkdir -p plugins/Skript/scripts/
  curl -L "${SKRIPT_PATH}" -o script.zip
  mv script.zip plugins/Skript/scripts/script.zip
  echo "Unzipping file..."
  cd plugins/Skript/scripts/ && unzip script.zip && rm script.zip && cd -
fi



# TODO: Read .minigame/config.toml for configurations on gamemode, etc.
# See documentation at https://docker-minecraft-server.readthedocs.io/en/latest/configuration/server-properties

# TODO: Use paper and add plugins/mods

# Hand control back to base image
/start