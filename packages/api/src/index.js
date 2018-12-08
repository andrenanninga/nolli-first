const express = require("express");

const app = express();

const port = process.env.PORT || 8080;

app.get("/", (req, res) => {
  res.json({ message: "Hello world" });
});

app.get("/api", (req, res) => {
  res.json({ message: "Hello world", api: true });
});

app.listen(port);
console.log(`Running on port ${port}`);
