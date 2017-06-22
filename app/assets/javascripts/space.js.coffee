window.Space = {}

# Any functionality which needs to be universally available
class Space.Universal
  constructor: ->
    @addTradeListener()


  addTradeListener: ->
    $(".trade-button").click (e) ->
      amount = $(".trade-input").val()
      console.log(amount)
      $.ajax({
        url: path
        dataType: "script"
        type: "GET"
      })