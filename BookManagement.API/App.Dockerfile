
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["BookManagement.API/BookManagement.API.csproj", "BookManagement.API/"]
COPY ["BookManagement.Application/BookManagement.Application.csproj", "BookManagement.Application/"]
COPY ["BookManagement.Domain/BookManagement.Domain.csproj", "BookManagement.Domain/"]
COPY ["BookManagement.Repository/BookManagement.Repository.csproj", "BookManagement.Repository/"]
RUN dotnet restore "BookManagement.API/BookManagement.API.csproj"
COPY . .
WORKDIR "/src/BookManagement.API"
RUN dotnet build "BookManagement.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BookManagement.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookManagement.API.dll"]