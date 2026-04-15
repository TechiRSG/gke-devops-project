const http = require('http');

http.createServer((req, res) => {
  res.end("Hello from GKE 🚀");
}).listen(3000);