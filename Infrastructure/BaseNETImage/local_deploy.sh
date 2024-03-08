#!/bin/bash
set -eux

docker build . -t registry.guildswarm.org/baseimages/dotnet_base:latest

