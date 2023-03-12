FROM nginx:stable-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY nginx/src/ /var/www/html/

EXPOSE 80

USER root

ENTRYPOINT ["nginx","-g","daemon off;"]
