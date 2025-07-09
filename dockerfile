FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
# For static output, Astro builds to /dist
COPY --from=build /app/dist /usr/share/nginx/html
# Optionally copy a custom nginx.conf if you have one
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose default nginx port
EXPOSE 80

# No need to run Astro preview server for static site
# Nginx will serve the static files
