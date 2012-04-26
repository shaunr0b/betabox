window.Betabox =
  
  Models:{}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    window.router = new Betabox.Routers.Artists
    Backbone.history.start()



$(document).ready ->
  Betabox.init()
  



