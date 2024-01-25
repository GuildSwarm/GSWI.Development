#!/bin/bash

# Define your list of directories here where are the deplo.sh for each image to build
declare -a directories=(
	"Infrastructure/BaseImage"
	"Infrastructure/BaseNETImage"
    "TheGoodFramework"
	"GSWB.Common"
    "GSWB.SwarmBot"
	"GSWB.APIGateway"
	"GSWB.Members"
)

# Iterate over the array of directories
for directory in "${directories[@]}"; do
    # Check if the directory exists
    if [ -d "$directory" ]; then
        echo "Entering directory: $directory"
        # Change to the directory
        cd "$directory" || exit

        # Check if deploy.sh exists in this directory
        if [ -f "deploy.sh" ]; then
            # Make deploy.sh executable
            chmod +x deploy.sh

            # Execute deploy.sh
            echo "Executing deploy.sh in $directory"
            ./deploy.sh

            # Return to the original directory
            cd - || exit
        else
            echo "Error: deploy.sh not found in $directory"
        fi
    else
        echo "Error: Directory '$directory' not found."
    fi
done

docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d
