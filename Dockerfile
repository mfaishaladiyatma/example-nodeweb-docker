# Use latest LTS version of Node.js (currently 20) based on Alpine
FROM node:20-alpine
# Set working directory
WORKDIR /app
# Copy package files first for layer caching
COPY package*.json ./
# Install only production dependencies
RUN npm install --production
# Copy the rest of the app
COPY . .
# Expose port
EXPOSE 3000
# Run the app
CMD ["npm", "start"]
