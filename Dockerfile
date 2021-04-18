FROM node:14
ENV NODE_ENV=production

WORKDIR /app

RUN mkdir node_modules

COPY --chown=node:node ["package*.json", "./"]

RUN npm install 
RUN npm install -g serve

COPY --chown=node:node . .

USER node 

RUN npm run build --production

EXPOSE 5000
ENTRYPOINT [ "serve" ]
CMD [ "-s", "build" ]