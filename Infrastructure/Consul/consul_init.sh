#!/usr/bin/dumb-init /bin/sh

set -e

function consul_init_func(){
# Infrastructure
consul services register -name=RabbitMQ -address=gswi.rabbitmq
consul services register -name=VaultSecretsManager -address=http://gswi.vault -port=8200
consul services register -name=PostgreSQL -address=gswi.postgres -port=5432

# Services
consul services register -name=SwarmBot -address=http://gswb.swarm-bot -port=8080
consul services register -name=Members -address=http://gswb.members -port=8080
}


