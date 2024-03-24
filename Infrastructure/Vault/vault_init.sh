
function vault_init_kv(){
echo "Vault initialization script started."

if [ "$ASPNETCORE_ENVIRONMENT" = "Development" ]; then
	PostgresEcho="Postgres key-value created for username = '$POSTGRES_USER' and password = '$POSTGRES_PASSWORD'";
	MySqlEcho="MySql key-value created for username = '$MySql_USER' and password = '$MySql_PASSWORD'";
else
	MySqlEcho="MySql key-value created for username and password"; 
	PostgresEcho="Postgres key-value created for username and password"; 
fi


##KeyValue secrets:
##RabbitMQ
vault kv put secret/rabbitmq Username=$RABBITMQ_USER Password=$RABBITMQ_PASSWORD && echo $RabbitMQEcho
##MySQL
vault kv put secret/mysql Username=$MYSQL_USER Password=$MYSQL_PASSWORD && echo $MySqlEcho
##PostgreSQL
vault kv put secret/postgres Username=$POSTGRES_USER Password=$POSTGRES_PASSWORD && echo $PostgresEcho
##DiscordAuth
vault kv put secret/discordauth ClientId=$DISCORD_ID ClientSecret=$DISCORD_SECRET && echo "discord client credentials were set!"
##DiscordBot
vault kv put secret/swarmbot BotToken=$SwarmBot_TOKEN DiscordTargetGuildId=$SwarmBot_GUILD_ID TestersDiscordTargetGuildId=$SwarmBot_TESTERS_GUILD_ID && echo "SwarmBot secrets were set!"
##API authentication secret token
vault kv put secret/tokensecrets AccessToken=$API_PRIV_KEY && echo "API authentication secret token was set!"

##YouTube Api key
vault kv put secret/youtube ApiKey=$YOUTUBE_API_KEY && echo "youtube secrets were set!"
}

function vault_init_rabbitmq(){
echo "Vault integration with RabbitMQ initialization started."

if [ "$ASPNETCORE_ENVIRONMENT" = "Development" ]; then
	RabbitMQEcho="RabbitMQ key-value created for username = '$RABBITMQ_USER' and password = '$RABBITMQ_PASSWORD'";
else
  	RabbitMQEcho="RabbitMQ key-value created for username and password";
fi

##Using the RabbitMQ integration with Vault.
rabbitmq_result=$(vault secrets enable rabbitmq)
echo "Enable Vault integration with RabbitMQ => $rabbitmq_result"

rabbitmq_result=$(vault write rabbitmq/config/connection \
					connection_uri="http://rabbitmq:15672" \
					username=$RABBITMQ_USER \
					password=$RABBITMQ_PASSWORD)
echo "Create Vault connection with $RabbitMQEcho => $rabbitmq_result"

rabbitmq_result=$(vault write rabbitmq/roles/GuildManagerSC-role \
					vhosts='{"/":{"write": ".*", "read": ".*"}}')
echo "RabbitMQ role created => $rabbitmq_result"

echo "Vault integration with RabbitMQ initialization finished."
}

