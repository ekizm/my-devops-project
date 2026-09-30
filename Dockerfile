# Base Image
FROM node:20-alpine

# Application working directory
WORKDIR /app

# first, copy packegee lists to optimize caching
COPY package*json ./

# install the dependencies
RUN npm ci --only=production

# Copy the source files
COPY . .

# set a non-root user for security
USER node

# Expose the port of app
EXPOSE 3000

# comand to start app.
CMD ["npm", "start"]
