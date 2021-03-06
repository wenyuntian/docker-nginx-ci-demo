FROM node:12.9.0
RUN apt-get update \
    && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 3000
RUN npm install \
    && npm run build \
    && cp -r build/* /var/www/html \
    && rm -rf /app
CMD ["nginx","-g","daemon off;"]
