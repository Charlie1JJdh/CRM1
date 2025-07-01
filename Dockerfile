FROM node:18-alpine

WORKDIR /app

COPY . .

RUN yarn install
RUN npx nx build twenty-server
RUN npx nx build twenty-front

ENV PROD=true
EXPOSE 3001

CMD ["sh", "-c", "yarn workspace twenty-server start:prod & yarn workspace twenty-front start:prod"]
