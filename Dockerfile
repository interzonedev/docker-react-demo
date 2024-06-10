# FROM node:16-alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# EXPOSE 80
# COPY --from=builder /app/build /usr/share/nginx/html

FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
# For npm@5 or later, copy package-lock.json as well
COPY package-lock.json .

RUN npm install

# Bundle app source
COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
