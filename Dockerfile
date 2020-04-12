FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# ENV CHOKIDAR_USEPOLLING=true
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html