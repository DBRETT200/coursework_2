# the image used is a node one

FROM node:8.16.2

# this instructs docker of which port to use

EXPOSE 8080

# copies the server.js file from the copy in jenkins directory taken from commited git file

COPY server.js .

# the command execute when the file is read

CMD node server.js