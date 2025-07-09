# Use official Node.js 20 image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the Astro project
RUN npm run build

# Expose Astro's default preview port
EXPOSE 4321

# Environment variable for port (optional)
ENV PORT=4321

# Run the preview server on all network interfaces
CMD ["npx", "astro", "preview", "--host", "0.0.0.0", "--port", "4321"]
