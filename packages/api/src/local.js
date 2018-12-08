const http = require("http");

const routes = {
  "/api/date": require("./date")
};

http
  .createServer(async (req, res) => {
    try {
      await routes[req.url](req, res);
    } catch (err) {
      res.writeHead(404);
      res.end();
    }
  })
  .listen(process.env.PORT || 1337);
