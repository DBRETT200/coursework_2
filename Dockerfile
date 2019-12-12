# the image used is a node one

FROM node:8.16.2

# this instructs docker of which port to use

EXPOSE 8080

# copies the server.js file from the copy in jenkins directory taken from commited git file

COPY server.js .

# sets up docker on the image container

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

# the command execute when the file is read

CMD node server.js