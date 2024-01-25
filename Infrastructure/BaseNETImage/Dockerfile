FROM registry.guildswarm.org/base-images/alpine-base:latest as base


# ASP.NET Core Runtime Stage
FROM mcr.microsoft.com/dotnet/runtime:8.0.1-alpine3.18-amd64 as aspnet-runtime
USER root
ENV ASPNET_VERSION=8.0.1
RUN wget -O aspnetcore.tar.gz "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/$ASPNET_VERSION/aspnetcore-runtime-$ASPNET_VERSION-linux-musl-x64.tar.gz" \
    && aspnetcore_sha512='b749398f5ad059c9d51e3153c9f41ac23145aea38e83a736259c4206fdb920c245685a60a6d4bcf74ce41c70f751fd133219fb66b263018ae53025e129535063' \
    && echo "$aspnetcore_sha512  aspnetcore.tar.gz" | sha512sum -c - \
    && tar -oxzf aspnetcore.tar.gz -C /usr/share/dotnet ./shared/Microsoft.AspNetCore.App \
    && rm aspnetcore.tar.gz
# .NET globalization APIs will use invariant mode by default because DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true is set
# by the base runtime-deps image. See https://aka.ms/dotnet-globalization-alpine-containers for more information.


# FINAL STAGE/IMAGE
FROM base AS final
#Copy the ASP.NET runtime
COPY --from=aspnet-runtime /usr/share/dotnet/shared/Microsoft.AspNetCore.App /usr/share/dotnet/shared/Microsoft.AspNetCore.App
CMD ["/bin/sh"]