# Sample Node.js application
# I learnt and executed the Project from Nasiullha Chaudhari
To Containerize an application we need to follow the Docker workflow:
1. Where the Developer will write the code part for the application:
2. We need to create a "Docker file" with set of instructions/steps to create a "Docker image"

Once you wrote the "Docker file", we can create a Docker image with the help of the file by simply running the "Docker command"
called: 

The Docker image is kind of a snapshot/screenshot of your application
So, with the help of Docker image, we can create the Docker container!!


3. Before writing the Docker file, the name of the Docker file should be exactly same as this "Dockerfile"
(If not the Docker file doesn't work, when you run it)



We need to write the Docker file with the help of Dockerfile instructions:

Here, FROM 
Is used: Create a new build stage from a base image
- Set the baseImage to use for subsequent instructions. FROM must be the first instruction in a Dockerfile



---
FROM baseImage:tag
FROM node:21-alpine

The tag of the base image to use.

Next,
Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT, or 
RUN instructions that follow it in the Dockerfile.


WORKDIR /the/workdir/path
WORKDIR /usr/src/app

This is the path where the all the commands gonna be executed and stored from now on:



Next,
Copy files or folders from source to the dest path in the image's filesystem.

COPY hello.txt /absolute/path
COPY hello.txt relative/to/workdir

COPY package*.json /usr/src/app/
Its gonna copy all the files which start with the name "package".json



Next,
Execute any commands on top of the current image as a new layer and commit the results.

RUN apt-get update && apt-get install -y curl
RUN npm install



Next,
COPY . .
The first "." refers to the current directory on the Docker host, where the Dockerfile is located. 
This is the source directory from which files or directories will be copied.

The second "." refers to the current directory within the Docker container. 
This is the destination directory where files or directories from the Docker host will be copied into.




Next,
Define the network ports that this "container" will listen on at runtime.

EXPOSE 8080
EXPOSE 80 443 22
EXPOSE 7000-8000





Next,
Provide defaults for an executing container. If an executable is not specified, 
then "ENTRYPOINT" must be specified as well. There can only be one CMD instruction in a Dockerfile.


CMD [ "/bin/ls", "-l" ]
CMD ["npm", "start"]



--------
So, after the Docker file is ready !

We need to "build the image" using this "Docker file"
To do that, 
We gonna use the command, called: "build"


Example:
docker build -t <name> <path_of_the_Dockerfile>
-t 
Here, t for tag, to give name of the file.

So, 
docker build -t todoapp .
Here, "." says that the "Dockerfile" is in the current directory

... When we run the above command it gonna create an Docker image.



To see the list of the images we have in the docker:
docker images



To run the image:
docker run -it -d -p 3000:3000 todoapp
docker run -it -t -p 3000:3000 d36ee913043f
either the name of the docker image "todoapp" or its image_id

-it 
for interactive shell

-d 
to run it in detach mode in the background


-p
to attch the ports or map the ports!
-p 3000:3000
run this application as a Docker container,in  which 3000 port in my local to the port 3000 in the container!

This repository is a sample Node.js application for Docker's documentation.
