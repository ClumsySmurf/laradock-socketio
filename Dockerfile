FROM mhart/alpine-node:6.7.0
# FROM mhart/alpine-node:base-4
# FROM mhart/alpine-node



RUN mkdir -p ./app
COPY app ./app
WORKDIR ./app


# If you have native dependencies, you'll need extra tools
#RUN apk add --no-cache make gcc g++ python

# If you need npm, don't use a base tag
RUN npm install

EXPOSE 3000
CMD ["node", "webserver.js"]
