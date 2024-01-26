FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine 
USER root
EXPOSE 8080
RUN apk --upgrade --no-cache add curl jq
RUN addgroup -g 2000 guildswarm && \
    adduser -D -u 2000 -G guildswarm guildswarm
USER guildswarm
CMD ["/bin/sh"]

