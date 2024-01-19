#!/usr/bin/dumb-init /bin/sh

set -e

function consul_init_func(){
# Infrastructure
consul services register -name=RabbitMQ -address=rabbitmq
consul services register -name=VaultSecretsManager -address=http://vault -port=8200
consul services register -name=MySQL -address=mysql -port=3306
consul services register -name=PostgreSQL -address=postgres -port=5432

# Services
consul services register -name=SwarmBot -address=http://gswb.swarm-bot -port=8080
consul services register -name=Members -address=http://gswb.members -port=8080
}


