FROM nginx:alpine

LABEL maintainer="karim@ubuntu"

RUN rm -rf /usr/share/nginx/html/*

COPY web/ /usr/share/nginx/html/

EXPOSE 80
