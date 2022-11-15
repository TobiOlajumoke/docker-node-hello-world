###First Stage###
FROM node:19-alpine3.15 AS builder
COPY . /src
RUN cd /src && npm install
EXPOSE 4000
###############

###Second stage###
FROM alpine
WORKDIR /app
COPY --from=builder . /src /app/
CMD ["node", "/src/server.js"]
