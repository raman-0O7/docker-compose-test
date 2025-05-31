
## Docker Installation
  - Install Docker
  - Create a network (docker network create docker-compose-test)
  - Start Postgres (docker run -d --network docker-compose-test --name postgres -e POSTGRES_PASSWORD=post1234 -p 5432:5432 postgres)
  - Build the image (docker build docker-compose-test .)
  - Start the image (docker run --network docker-compost-test -e DATABASE_URL=postgresql://postgres:post1234@postgres:5432/postgres -p 3000:3000 docker-compose-test)


## Docker compose
 - Install docker and docker-compose
 - Start compose (docker-compose up)