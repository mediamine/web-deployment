# nginx/Dockerfile

FROM nginx:1.23.3-alpine

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443