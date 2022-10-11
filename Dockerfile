FROM node:16.17.1-buster-slim

# Install curl
RUN apt-get update && apt-get install -y curl && apt-get install -y gnupg2

# Install Nodejs version 16.
RUN curl -sL https://deb.nodesource.com/setup_16.17.1 -o /tmp/nodesource_setup.sh

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Author
LABEL author="Tran Dai Minh"

# Install rsync and openssh
RUN apt-get install rsync -y && apt-get install openssh-server -y