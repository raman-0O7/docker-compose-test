FROM node:20-alpine

WORKDIR /app

COPY ./package.json  ./package.json
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml
 
RUN npm i -g pnpm
RUN pnpm install

COPY . .

RUN pnpm prisma generate
RUN pnpm build

CMD [ "pnpm", "dev:docker" ]