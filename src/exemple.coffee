# http = require('http')
# user = require('./user')
#
# http.createServer((req, res) ->
#   user.get 'Louis', (id) ->
#     res.writeHead 200, 'Content-Type': 'text/plain'
#     res.end 'hello ' + id
#     return
#   return
# ).listen 1337, '127.0.0.1'

express = require 'express'
metrics = require './metrics'
bodyparser = require 'body-parser'
db = require './db'
app = express()


app.use bodyparser.json()
app.use bodyparser.urlencoded()

app.set 'port', 1337

app.set('view engine', 'pug')
app.set('views', "#{__dirname}/../views")

app.use '/', express.static "#{__dirname}/../public"

app.get '/', (req, res) ->
  res.end "Hello World"
  #res.render 'layout', {}

app.get '/hello/:name', (req, res) ->
  #res.end "hello @{req.params}"
  res.render 'index',
    name: req.params.name

app.get '/request', (req, res) ->
  console.log req
  res.end "done"

app.get '/metrics.json', (req, res) ->
    metrics.get (err, data) ->
      trhow next err if err
      res.status(200).json data

app.post '/metrics', (req, res) ->
  req.body.timestamp
  req.body.value

  db.put "metrics:0:#{req.body.timestamps}", req.body.value, (err) ->
    throw next err if err
    rest.status(200).json req.body

app.get "/metrics/:id", (req, res) ->
  db.get req.param.id, (err, value) ->
    throw err if err
    res.status(200).json value


app.listen app.get('port'), ->
  console.log "listening on port #{app.get 'port' }"
