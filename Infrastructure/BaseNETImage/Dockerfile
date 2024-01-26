FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine as build
USER root
EXPOSE 8080
#CVE-2023-6129
RUN apk --no-cache update && \
    apk --no-cache upgrade libcrypto3 libssl3

RUN addgroup -g 2000 guildswarm && \
    adduser -D -u 2000 -G guildswarm guildswarm
USER guildswarm
CMD ["/bin/sh"]

