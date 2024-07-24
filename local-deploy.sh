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
	"GSWB.Events"
)
start_time=$(date +%s)
# Iterate over the array of directories
for directory in "${directories[@]}"; do
    # Check if the directory exists
    if [ -d "$directory" ]; then
        echo "Entering directory: $directory"
        # Change to the directory
        cd "$directory" || exit

        # Check if local_deploy.sh exists in this directory
        if [ -f "local_deploy.sh" ]; then
            # Make local_deploy.sh executable
            chmod +x local_deploy.sh

            # Execute local_deploy.sh
            echo "Executing local_deploy.sh in $directory"
            ./local_deploy.sh

            # Return to the original directory
            cd - || exit
        else
            echo "Error: deploy.sh not found in $directory"
        fi
    else
        echo "Error: Directory '$directory' not found."
    fi
done
export ENVIRONMENT_TAG=development
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d

# Record the end time
end_time=$(date +%s)

# Calculate the total execution time
total_time=$((end_time - start_time))

echo "Local deploy execution time: $total_time seconds."
