
FROM mcr.microsoft.com/mssql/server:2022-latest

# Change active user to root
USER root 

# Set mssql as owner of the app directory
RUN chown mssql /usr/src/app

USER mssql

# Create the app directory
WORKDIR /usr/src/app

# Copy initialization scripts
COPY BookManagement.API/MsSql /usr/src/app

# Expose port 1433 in case accessing from other container
# Expose port externally from docker-compose.yml
EXPOSE 1433

# Run Microsoft SQL Server and initialization script (at the same time)
ENTRYPOINT ["sh", "./entrypoint.sh"]
