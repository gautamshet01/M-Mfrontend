
FROM node:16

# Set the working directory to /frontend
WORKDIR /frontend

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install 
RUN npm install echarts-for-react react-markdown remark-gfm react-speech-recognition


# Copy the entire content of the local directory to the working directory
COPY . .

# Run the build step
RUN npm run build

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variable
ENV NODE_ENV=production

# Command to run your application
CMD ["npm","start"]

