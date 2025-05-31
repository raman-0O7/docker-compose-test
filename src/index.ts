import { PrismaClient } from "@prisma/client";
import express from "express";


const app = express();
app.use(express.json());
const client = new PrismaClient();

app.get("/", async (req, res) => {
  const users = await client.user.findMany();
  res.json({
    users,
    message: "Get endpoint"
  })
});

app.post("/", async (req, res) => {
  const {email, username, password} = req.body;

  const createdUser = await client.user.create({
    data: {
      email: email ?? Math.random().toString(),
      username: username ?? Math.random().toString(),
      password: password ?? Math.random().toString()
    }
  })
  res.json({
    createdUser,
    message: "Post endpoint"
  })
});

app.listen(3000, () => console.log("Server Running on 3000"));