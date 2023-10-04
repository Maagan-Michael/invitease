FROM node:18-bullseye-slim as builder

RUN mkdir /source

WORKDIR /source

ADD src/ /source/src
ADD public/ /source/public
ADD package.json tsconfig.json /source/

RUN npm install \
  && npm run build

FROM nginx:1.25.2-alpine

ADD nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /source/build /var/www/
