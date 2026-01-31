# Build stage
FROM node:18
WORKDIR /app

# Install dependencies and build
COPY package.json package-lock.json* ./
RUN npm install --silent
COPY . .
RUN npm run build
