# Use the official Alpine base image
FROM alpine:latest

# Create the directory /usr/src/app/
RUN mkdir -p /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Copy the script.sh file into the /usr/src/app/ directory
COPY script.sh .

RUN apk --no-cache add bash inotify-tools


# Set permissions for the script.sh file
RUN chmod +x script.sh




RUN apk --no-cache add bash
CMD ["/bin/bash", "-c", "/usr/src/app/script.sh"]

