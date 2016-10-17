levelup = require 'levelup'
levelws = require 'level-ws'
db = levelws levelup "#{__dirname}/../db"

module.export =
  put: (id, metrics, callback) ->
    ws = db.createWriteStream()
    ws.on 'error', callback
    ws.on 'close', callback
    for m in metrics
      { timestamps, metric } = m
      console.log "writing #{m}"
      ws.write
        key: "metric: #{id}:#{timestamp}"
        value: value
    ws.end()

  get: (id, callback) ->
    metrics = []
    rs = db.createReadStream
      gte: "metric:#{id}:"
      lt: "metric:#{id+1}:"
    rs.on 'data', (data) ->
      [_, _id, timestamp] = data.key.split ':'
      metrics.push
        id: _id
        timestamp: timestamp
        value: data.value
    rs.on 'error', callback
    rs.on 'close', ->
      callback null, metrics
