#!/bin/bash

Environment=development

start_time=$(date +%s)

docker-compose -f docker-compose.yml down
docker image prune --force

docker rmi registry.guildswarm.org/$Environment/members:latest 
docker rmi registry.guildswarm.org/$Environment/swarm_bot:latest
docker rmi registry.guildswarm.org/$Environment/api_gateway:latest

docker rmi registry.guildswarm.org/$Environment/common:latest
docker rmi registry.guildswarm.org/$Environment/the_good_framework:latest

docker rmi registry.guildswarm.org/$Environment/dotnet_base:latest
docker rmi registry.guildswarm.org/$Environment/alpine_base:latest

end_time=$(date +%s)

# Calculate the total execution time
total_time=$((end_time - start_time))

echo "Local deploy clean execution time: $total_time seconds."
