# Use Node.js as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React application
RUN npm run build

# Use a lightweight server to serve the static files
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Serve the build files
CMD ["serve", "-s", "build"]

