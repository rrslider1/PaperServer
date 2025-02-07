#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.
set -x  # Print each command before executing it.

echo "Starting entrypoint.sh..."
echo "Current environment variables:"
env

# If the PORT environment variable is set, update server.properties
if [ -n "$PORT" ]; then
  echo "Setting server port to $PORT"
  # Create a backup (optional) and update the port
  sed -i.bak "s/^server-port=.*/server-port=$PORT/" server.properties
else
  echo "PORT environment variable is not set; using default server port in server.properties."
fi

echo "server.properties content after update:"
cat server.properties

# Start the Paper server with limited memory
exec java -Xmx512M -Xms512M -jar paper-1.21.4-138.jar nogui
