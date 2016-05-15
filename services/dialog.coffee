global.Dispatcher = require("backbone-events-standalone")

primusI = Primus.connect 'http://localhost:8087'
primusO = Primus.connect 'http://localhost:8088'
primusO.on 'open', ->
  primusI.id (id) ->
    primusO.write(id)
    start()

Dispatcher.send = (data) -> primusI.write data
primusO.on 'data', (data) ->
  console.log data
  unless data == "benchmarked!"
    parsed_data = JSON.parse(data)
    if parsed_data.event
      Dispatcher.trigger parsed_data.event, parsed_data
    else
      Store.update parsed_data
