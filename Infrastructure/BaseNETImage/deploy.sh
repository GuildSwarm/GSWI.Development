#!/bin/bash
set -eux

DockerVersion=1.0.0
docker build . -t registry.guildswarm.org/base-images/dotnet-base:$DockerVersion -t registry.guildswarm.org/base-images/dotnet-base:latest

