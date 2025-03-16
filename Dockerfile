# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory
WORKDIR /opt/survev

# Install necessary packages
RUN apt-get update && \
    apt-get install -y nginx git openssl && \
    apt-get clean

# Install pnpm
RUN npm install -g pnpm

# Clone the Survev repository
RUN git clone https://github.com/leia-uwu/survev.git . && \
    pnpm install

# Expose ports for the reverse proxy
EXPOSE 8008 4443

# Start the server
CMD ["pnpm", "start"]