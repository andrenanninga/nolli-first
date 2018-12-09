const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());

const routes = {
  "/api/date": require("../src/date")
};

app.get(/.*/, async (req, res) => {
  try {
    await routes[req.url](req, res);
  } catch (err) {
    res.status(404).json({ error: "Route not found" });
  }
});

app.listen(3001, () => {
  console.log("lambdaServer running on port 3001");
});
