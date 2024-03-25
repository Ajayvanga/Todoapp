FROM node:21-alpine
# I have used the Node.js base image 


# And set the working Directory in the container to store the files and commands
WORKDIR /usr/src/app


# Then, here we are using the COPY instruction of the docker to copy package.json and package-lock.json files.
COPY package*.json /usr/src/app/


# To give the Todo application necessary dependency files
RUN npm install



# To copy all the other contents of the code from the local to the Container working directory
COPY . .




# And with the Docker instruction named: EXPOSE, we need to expose the port on which the Node.js application is running 
EXPOSE 3000



# command to start the Node.js application

CMD ["npm", "start"]

