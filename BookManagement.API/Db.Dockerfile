
FROM mcr.microsoft.com/mssql/server:2022-latest

# Create the app directory
WORKDIR /usr/src/app

# Copy initialization scripts
COPY BookManagement.API/MsSql /usr/src/app

# Change active user to root
USER root 

# Grant permissions for the run-initialization script to be executable
RUN chmod +x /usr/src/app/run-initialization.sh

# Change back to user mssql
USER mssql

# Expose port 1433 in case accessing from other container
EXPOSE 1433

# Run Microsoft SQL Server and initialization script (at the same time)
# Note: If you want to start MsSql only (without initialization script) you can comment bellow line out, entry from base image will be taken
ENTRYPOINT ["sh", "./entrypoint.sh"]