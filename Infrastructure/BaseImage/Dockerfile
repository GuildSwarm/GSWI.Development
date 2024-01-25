FROM alpine:3.19

RUN apk --no-cache add curl jq git
RUN addgroup -g 2000 guildswarm && \
    adduser -D -u 2000 -G guildswarm guildswarm

USER guildswarm
WORKDIR /home/guildswarm

CMD ["/bin/sh"]