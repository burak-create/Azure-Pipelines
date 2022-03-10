# syntax=docker/dockerfile:1

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY drop/app/ /app
ENTRYPOINT ["dotnet", "DummyProject.WebApi.dll"]