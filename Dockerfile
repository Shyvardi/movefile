# Use the official Alpine base image
FROM alpine:latest

# Create the directory /usr/src/app/
RUN mkdir -p /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Download script.sh from GitHub using ADD
ADD https://raw.githubusercontent.com/Shyvardi/movefile/main/script.sh script.sh

RUN apk --no-cache add bash inotify-tools
RUN apk update && apk add --no-cache lsof


# Set permissions for the script.sh file
RUN chmod +x script.sh




RUN apk --no-cache add bash
CMD ["/bin/bash", "-c", "/usr/src/app/script.sh"]

