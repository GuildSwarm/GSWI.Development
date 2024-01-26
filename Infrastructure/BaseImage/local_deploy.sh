#!/bin/bash
set -eux

Environment=development
docker build . -t registry.guildswarm.org/$Environment/alpine_base:latest

