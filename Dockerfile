FROM node:8-alpine

WORKDIR /usr/src/app

COPY package.json yarn.lock /usr/src/app/
RUN yarn install --non-interactive --pure-lockfile

COPY . /usr/src/app/

CMD ["yarn", "start"]
