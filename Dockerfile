FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    xvfb \
    x11-apps \
    libgtk-3-0 \
    libnss3 \
    libgconf-2-4 \
    libasound2 \
    curl

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Set the display environment variable
ENV DISPLAY=:0

# Copy and install Playwright
WORKDIR /app
COPY . .
RUN npm install
RUN npx playwright install chromium
RUN npx playwright install-deps

# Start your application (replace this with your Playwright command)
CMD [ "npm", "start" ]
