FROM node:16

RUN apt update
RUN apt install dumb-init
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package*.json .
RUN npm ci --only=production

COPY index.js .

EXPOSE 8080

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["node","index.js"]
