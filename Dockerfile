FROM node:16

RUN mkdir -p /app

WORKDIR /app

ADD . /app

RUN npm install

RUN echo "hello"

EXPOSE 3000 

CMD ["node", "app.js"]