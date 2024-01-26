#!/bin/bash
set -eux

Environment=development
docker build . --build-arg ENVIRONMENT=$Environment -t registry.guildswarm.org/$Environment/dotnet_base:latest

