FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose Astro's default preview port
EXPOSE 4321

# Environment variable for port (optional)
ENV PORT=4321

# Run the preview server on all network interfaces
CMD ["npx", "astro", "preview", "--host", "0.0.0.0", "--port", "4321"]
