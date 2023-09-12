# Use node image as base image
FROM node:18-alpine AS development

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV API_KEY=84c7ddb2b41f32a05cb8c31c5a2f7505

# Expose the port the app runs on
EXPOSE 5004

#Creates a "dist" folder with the production build
RUN npm run build

# Set the command to start the node server
CMD [ "npm", "start" ]
