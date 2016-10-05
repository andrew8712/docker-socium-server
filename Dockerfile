FROM node:argon

ENV PARSE_HOME /parse

ADD package.json ${PARSE_HOME}/

ENV CLOUD_CODE_HOME ${PARSE_HOME}/cloud
#ADD cloud/*.js $CLOUD_CODE_HOME/

WORKDIR $PARSE_HOME
RUN npm install

ADD index.js ${PARSE_HOME}/

ENV PORT 1337

EXPOSE $PORT
VOLUME $CLOUD_CODE_HOME
ENV NODE_PATH .

CMD ["npm", "start"]
