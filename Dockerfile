# --- 1 Stage aja ---
#FROM node:dubnium-alpine3.11
#WORKDIR /usr/app
#COPY . .
#RUN npm install
#EXPOSE 3000
#CMD [ "npm", "start" ]

# --- multiple stage ---
FROM node:dubnium-alpine3.11 AS build-env
WORKDIR /usr/app
COPY . .
RUN npm install
EXPOSE 3000

FROM node:dubnium-alpine3.10
WORKDIR /usr/app
COPY --from=build-env /usr/app ./
CMD [ "npm", "start" ]

