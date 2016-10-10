http = require('http')
user = require('./user')

http.createServer((req, res) ->
  user.get 'Louis', (id) ->
    res.writeHead 200, 'Content-Type': 'text/plain'
    res.end 'hello ' + id
    return
  return
).listen 1337, '127.0.0.1'
