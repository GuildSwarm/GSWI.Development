FROM postgres:15-alpine3.18

EXPOSE 5432

# Copy your initialization script
COPY Infrastructure/PostgreSQL/Init.sh /docker-entrypoint-initdb.d/

# Grant execution permissions
RUN chmod +x /docker-entrypoint-initdb.d/Init.sh

