# syntax=docker/dockerfile:1

FROM itzg/minecraft-server:latest


ADD download_and_start.sh /download_and_start.sh
RUN chmod +x /download_and_start.sh

# zip file containing configurations defined in toml, as well as the world save
ENV CONFIG_PATH=

# Configuration
ENV LEVEL=world

ENTRYPOINT [ "/download_and_start.sh" ]
