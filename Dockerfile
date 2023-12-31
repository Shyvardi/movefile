# Use the official Alpine base image
FROM alpine:latest
RUN apk update
RUN apk add psmisc \
    && echo "Installed psmisc successfully"
RUN apk --no-cache add bash
RUN apk --no-cache add inotify-tools


# Create the directory /usr/src/app/
RUN mkdir -p /usr/src/app/

# Set the working directory
WORKDIR /usr/src/app/

# Download script.sh from GitHub using ADD
ADD https://raw.githubusercontent.com/Shyvardi/movefile/main/script.sh script.sh





# Set permissions for the script.sh file
RUN chmod +x script.sh




RUN apk --no-cache add bash
CMD ["/bin/bash", "-c", "/usr/src/app/script.sh"]

