window.Planet = {}

# Any functionality which needs to be universally available
class Planet.Universal
  constructor: ->
    @addPlanetListener()


  addPlanetListener: ->
    $(".planet-graphic").click (e) ->
      console.log($(e.target).siblings(".planet-link"))
      $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: "/games/4/planets/30"
      })
