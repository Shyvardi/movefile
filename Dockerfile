# Use a base image with a shell
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app
# Download the script from GitHub
ADD https://raw.githubusercontent.com/Shyvardi/myscript/main/script.sh /app/

# Copy the script into the container at /app
COPY script.sh /app/

# Make the script executable
RUN chmod +x /app/script.sh

# Define an entry point for the container
ENTRYPOINT ["/app/script.sh"]
