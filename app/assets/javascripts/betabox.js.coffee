window.Betabox =
  
  Models:{}
  Collections: {}
  Views: {}
  Routers: {}
  init: (data)->
    artists = new Betabox.Collections.Artists(data.artists)
    window.router = new Betabox.Routers.Artists(artists: artists)
    Backbone.history.start()
    

$(document).ready ->
  #Betabox.init()
  



