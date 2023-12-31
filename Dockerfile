# Use the official Ubuntu base image
FROM ubuntu:latest

# Update package index and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    psmisc \
    bash \
    inotify-tools && \
    rm -rf /var/lib/apt/lists/*

# Create the directory /usr/src/app/
RUN mkdir -p /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Download script.sh from GitHub using ADD
ADD https://raw.githubusercontent.com/Shyvardi/movefile/main/script.sh script.sh

# Set permissions for the script.sh file
RUN chmod +x script.sh

# Run the script.sh using bash
CMD ["/bin/bash", "-c", "/usr/src/app/script.sh"]
