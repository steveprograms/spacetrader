window.Space = {}

# Any functionality which needs to be universally available
class Space.Universal
  constructor: ->
    console.log("HELLO")
    @addTradeListener()


  addTradeListener: ->
    console.log("listening")
    $(".trade-button").click (e) ->
      console.log("trading")