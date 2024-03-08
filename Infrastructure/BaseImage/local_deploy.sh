#!/bin/bash
set -eux

docker build . -t registry.guildswarm.org/baseimages/alpine_base:latest

