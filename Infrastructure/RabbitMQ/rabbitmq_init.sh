set -euo pipefail
#set -x

function rabbitmq_init_func(){
echo "RabbitMQ initialization script started."

if [ "$ASPNETCORE_ENVIRONMENT" = "Development" ]; then
	CreateUserEcho="*** Administrator user '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD' created successfully! ***"
else
	CreateUserEcho="Administrator user created successfully!" 
fi

# Check if RabbitMQ user exists
if rabbitmqctl list_users | grep -q $RABBITMQ_USER; then
	echo "User '$RABBITMQ_USER' already exists, skipping creation."
else
	# Create RabbitMQ user
	rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD 
	rabbitmqctl set_user_tags $RABBITMQ_USER administrator 
	rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*" 
	echo $CreateUserEcho
fi
	
echo "RabbitMQ initialization script finished."
}
