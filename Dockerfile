# Use a base image with Java 21 (adjust as needed)
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /server

# Copy your server files into the container
COPY paper-1.21.4-138.jar .
COPY eula.txt .
COPY server.properties .
COPY plugins/ ./plugins/

# (Optional) Copy your world folder if you want to preserve world data:
COPY world/ ./world/

# Expose the ports:
# - 25565/tcp for Java connections (if needed)
# - 19132/udp for Bedrock (Geyser/Floodgate) connections
EXPOSE 25565/tcp 19132/udp

# Start the Paper server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "paper-1.21.4-138.jar", "nogui"]
