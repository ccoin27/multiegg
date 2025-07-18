const http = require('http');

const port = process.env.SERVER_PORT || 5000;

const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from Node.js server!\n');
});

server.listen(port, () => {
  console.log(`Node.js server running on port ${port}`);
});
