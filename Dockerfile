# Use a base image with a shell
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Download the script from GitHub
# RUN wget https://raw.githubusercontent.com/Shyvardi/myscript/main/script.sh -O /app/script.sh

# Print the contents of /app for debugging
RUN ls -la /app

# Make the script executable
# RUN chmod +x /app/script.sh

# Define an entry point for the container
# ENTRYPOINT ["/app/script.sh"]
