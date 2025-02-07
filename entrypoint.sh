#!/bin/bash

# Check if the PORT environment variable is set
if [ -n "$PORT" ]; then
  echo "Setting server port to $PORT"
  # Update the server.properties file to set the server-port to the dynamic port
  sed -i "s/^server-port=.*/server-port=$PORT/" server.properties
fi

# Optionally, print the updated server.properties for debugging
cat server.properties

# Start the Paper server
exec java -Xmx512M -Xms512M -jar paper-1.21.4-138.jar nogui
