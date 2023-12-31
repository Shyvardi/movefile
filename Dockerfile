# Use the official Alpine base image
FROM alpine:latest

RUN apk --no-cache add bash
RUN apk --no-cache add inotify-tools
RUN apk --no-cache add lsof




# Create the directory /usr/src/app/
RUN mkdir -p /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Download script.sh from GitHub using ADD
ADD https://raw.githubusercontent.com/Shyvardi/movefile/main/script.sh script.sh






# Set permissions for the script.sh file
RUN chmod +x script.sh

CMD ["/bin/bash", "-c", "/usr/src/app/script.sh"]
