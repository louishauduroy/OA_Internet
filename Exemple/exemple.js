 var http = require('http')
 var user = require('./exemple2.js')

 http.createServer(function(req, res) {

  res.writeHead(200, {'Content-Type': 'text/plain'});

  res.end(user.getName());

}).listen(1337, '127.0.0.1')
