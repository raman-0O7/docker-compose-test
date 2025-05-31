FROM node:20-alpine

WORKDIR /app

COPY ./package.json  ./package.json
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml
 
RUN npm i -g pnpm
RUN pnpm install

COPY . .

ENV DATABASE_URL=postgresql://postgres:post1234@localhost:5432/postgres 

RUN pnpm prisma migrate dev
RUN pnpm prisma generate
RUN pnpm build

CMD [ "pnpm", "start" ]