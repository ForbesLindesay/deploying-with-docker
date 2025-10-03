FROM node:24-alpine

WORKDIR /app
ENV NODE_ENV=production

COPY ./package.json package-lock.json /app/
RUN npm install --omit=dev

COPY ./build /app/build/
CMD ["npm", "run", "start"]
