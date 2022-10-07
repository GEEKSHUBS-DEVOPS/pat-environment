FROM node:16 AS builder
RUN npm i -g @angular/cli
WORKDIR /app
COPY . .
RUN npm i
RUN pwd
RUN ng build

FROM nginx
COPY --from=builder /app/dist/frontend /usr/share/nginx/html
COPY docker-entrypoint.sh /docker-entrypoint.sh




